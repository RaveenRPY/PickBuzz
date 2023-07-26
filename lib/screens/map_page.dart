import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:icons_plus/icons_plus.dart';

class BusMap extends StatefulWidget {
  final String route;
  final int index;
  final double latitude;
  final double longitude;

  const BusMap({
    Key? key,
    required this.route,
    required this.index,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  @override
  State<BusMap> createState() => BusMapState();
}

class BusMapState extends State<BusMap> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  Set<Marker> _markers = {};
  late Timer _timer;
  LatLng? _userPosition; // Variable to store the user's current position

  @override
  void initState() {
    super.initState();
    // Start the timer to update the bus location every 1 second
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _updateBusLocation();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collectionGroup(widget.route)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                // You can add any additional logic here if needed.
                return const SizedBox(); // Return an empty SizedBox to avoid rendering the StreamBuilder content.
              },
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: GoogleMap(
              myLocationEnabled: true,
              compassEnabled: false,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(widget.latitude, widget.longitude),
                zoom: 9,
                tilt: 0,
              ),
              markers: _markers,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 150,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 255, 255, 255),
                      Color.fromARGB(0, 255, 255, 255),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: 12,
            bottom: 20,
            child: ElevatedButton(
              onPressed: _goToCurrentPosition,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                alignment: Alignment.center,
                elevation: 5,
                padding: const EdgeInsets.all(15),
              ),
              child: const Icon(Icons.location_history),
            ),
          ),
          Positioned(
            right: 12,
            bottom: 85,
            child: ElevatedButton(
              onPressed: _zoomToBus,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                alignment: Alignment.center,
                elevation: 5,
                padding: const EdgeInsets.all(15),
              ),
              child: const Icon(BoxIcons.bx_bus),
            ),
          ),
          Positioned(
            right: 12,
            bottom: 150,
            child: ElevatedButton(
              onPressed: _zoomToFit,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                alignment: Alignment.center,
                elevation: 5,
                padding: const EdgeInsets.all(15),
              ),
              child: const Icon(Icons.my_location_rounded),
            ),
          ),
          Positioned(
            left: 5,
            top: 45,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                alignment: Alignment.center,
                elevation: 5,
                padding: const EdgeInsets.all(10),
              ),
              child: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ),
          // Add your other UI elements here...
        ],
      ),
    );
  }

  // Function to update the bus location based on Firestore data
  void _updateBusLocation() async {
    try {
      var snapshot =
          await FirebaseFirestore.instance.collectionGroup(widget.route).get();
      if (snapshot.docs.isNotEmpty) {
        var set = snapshot.docs[widget.index];
        var geo = set['GPS'] as GeoPoint;
        var lat = geo.latitude;
        var lon = geo.longitude;
        // Update the marker position
        _updateMarkerPosition(LatLng(lat, lon));
      }
      // ignore: empty_catches
    } catch (e) {}
  }

  // Function to update the bus marker position
  void _updateMarkerPosition(LatLng newPosition) {
    setState(() {
      _markers = {
        Marker(
          markerId: const MarkerId("1"),
          position: newPosition,
          infoWindow: const InfoWindow(
            title: 'My Bus',
          ),
          onTap: () {
            // Call the _zoomToBus function when the bus marker is tapped
            _zoomToBus();
          },
        ),
      };
    });
  }

  // Function to zoom the map to the bus location
  void _zoomToBus() async {
    CameraPosition cameraPosition = CameraPosition(
      target: _markers.first.position,
      zoom: 16,
      tilt: 20,
    );

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(cameraPosition),
    );
  }

  // Function to get and store the user's current location
  void _goToCurrentPosition() async {
    Position? position = await Geolocator.getCurrentPosition();
    if (position != null) {
      setState(() {
        _userPosition = LatLng(position.latitude, position.longitude);
      });
      CameraPosition cameraPosition = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 16,
        tilt: 20,
      );

      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

      // Zoom to fit both the user's position and bus position
    }
  }

  // Function to zoom the map to fit both the user's position and bus position
  void _zoomToFit() async {
    if (_userPosition != null && _markers.isNotEmpty) {
      final GoogleMapController controller = await _controller.future;

      LatLngBounds bounds = LatLngBounds(
        southwest: LatLng(
          _userPosition!.latitude < _markers.first.position.latitude
              ? _userPosition!.latitude
              : _markers.first.position.latitude,
          _userPosition!.longitude < _markers.first.position.longitude
              ? _userPosition!.longitude
              : _markers.first.position.longitude,
        ),
        northeast: LatLng(
          _userPosition!.latitude > _markers.first.position.latitude
              ? _userPosition!.latitude
              : _markers.first.position.latitude,
          _userPosition!.longitude > _markers.first.position.longitude
              ? _userPosition!.longitude
              : _markers.first.position.longitude,
        ),
      );

      controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 90.0));
    }
  }
}

// ignore_for_file: avoid_print

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

  BusMap(
      {Key? key,
      required this.route,
      required this.index,
      required this.latitude,
      required this.longitude})
      : super(key: key);

  @override
  State<BusMap> createState() => BusMapState();
}

class BusMapState extends State<BusMap> {
  late String route;
  late int index;
  double lat = 7.09898;
  double lon = 81.213456;
  late var initGPS;

  final Completer<GoogleMapController> _controller = Completer();

  final List<Marker> _markers = <Marker>[];

  Future<Position?> getUserCurrentLocation() async {
    try {
      return await Geolocator.getCurrentPosition();
    } catch (e) {
      // ignore: prefer_interpolation_to_compose_strings
      print("ERROR: " + e.toString());
      return null;
    }
  }

  // ignore: unused_element
  void _autoRunFunction() {
    setState(() {
      _goToBus();
    });
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 1), (Timer timer) {
      _autoRunFunction();
    });
  }

  @override
  Widget build(BuildContext context) {
    route = widget.route;
    index = widget.index;

    initGPS = CameraPosition(
      target: LatLng(widget.latitude, widget.longitude),
      zoom: 8,
      tilt: 0,
    );

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collectionGroup(route).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                Future.delayed(const Duration(milliseconds: 100), () {
                  var buses = snapshot.data!.docs;
                  final set = buses[index];
                  final geo = set['GPS'] as GeoPoint;
                  lat = geo.latitude;
                  lon = geo.longitude;
                });

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
              initialCameraPosition: initGPS,
              markers: Set<Marker>.from(_markers), // Add markers to the map.
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
              onPressed: _zoomOut,
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
        ],
      ),
    );
  }

  Future<void> _zoomOut() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(initGPS));
  }

  Future<void> _goToCurrentPosition() async {
    getUserCurrentLocation().then(
      (Position? value) async {
        if (value != null) {
          // ignore: prefer_interpolation_to_compose_strings
          print(value.latitude.toString() + " " + value.longitude.toString());

          CameraPosition cameraPosition = CameraPosition(
            target: LatLng(value.latitude, value.longitude),
            zoom: 16,
            tilt: 0,
          );

          final GoogleMapController controller = await _controller.future;
          controller
              .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
        } else {
          print("Unable to get the current location.");
        }
      },
    );
  }

  Future<void> _goToBus() async {
    // _markers.clear();

    _markers.add(
      Marker(
        markerId: const MarkerId("1"),
        position: LatLng(lat, lon),
        infoWindow: const InfoWindow(
          title: 'My Bus',
        ),
      ),
    );
  }

  Future<void> _zoomToBus() async {
    CameraPosition cameraPosition = CameraPosition(
      target: LatLng(lat, lon),
      zoom: 16,
    );

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(cameraPosition),
    );
  }
}

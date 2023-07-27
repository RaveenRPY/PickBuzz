import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pickbuzz/screens/map_page.dart';

class BusList extends StatefulWidget {
  final String? startStop;
  final String? endStop;
  final String? route;

  const BusList(
      {Key? key,
      required this.startStop,
      required this.endStop,
      required this.route})
      : super(key: key);

  @override
  State<BusList> createState() => _BusListState();
}

class _BusListState extends State<BusList> {
  // ignore: prefer_typing_uninitialized_variables
  late var buses;

  late DatabaseReference _dbRef;
  var _lat;
  var _lon;

  @override
  void initState() {
    super.initState();
    // Initialize Firebase
    Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 5,
        title: const Text(
          "Search Bus",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded,
                  color: Color.fromARGB(255, 0, 0, 0)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          },
        ),
        surfaceTintColor: Colors.white,
        shadowColor: const Color.fromARGB(40, 154, 255, 233),
        centerTitle: true,
      ),
      bottomNavigationBar: NavigationBar(
        surfaceTintColor: Colors.white,
        elevation: 0,
        shadowColor: const Color.fromARGB(255, 154, 255, 233),
        onDestinationSelected: (int index) {
          // ignore: avoid_print
          print('Selected $index');
        },
        selectedIndex: 2,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.manage_search_rounded),
            icon: Icon(Icons.search_rounded),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.route_outlined),
            icon: Icon(Icons.room_outlined),
            label: '',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
                width: 100,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collectionGroup('${widget.route}')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: Stack(
                          children: [
                            CircularProgressIndicator(),
                          ],
                        ),
                      );
                    }
                    buses = snapshot.data!.docs;

                    return ListView.separated(
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(
                        color: Color.fromARGB(0, 0, 0, 0),
                        endIndent: 20,
                        indent: 20,
                      ),
                      itemCount: buses.length - 1,
                      itemBuilder: (context, index) {
                        final post = buses[index];
                        // ignore: non_constant_identifier_names
                        String Number = post['Number'];
                        // ignore: non_constant_identifier_names
                        String STime = post['Time'];
                        bool track = false;

                        late double latitude;
                        late double longitude;

                        String route =
                            "${widget.startStop}" " -> " "${widget.endStop}";
                        int option = index + 1;

                        Map<String, dynamic> map = buses[index].data();

                        if (map.containsKey('GPS')) {
                          // Replace field by the field you want to check.
                          track = true;
                          final gps = post["GPS"] as GeoPoint;
                          latitude = gps.latitude;
                          longitude = gps.longitude;
                        }

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(255, 214, 214, 214),
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                  blurRadius: 8.0,
                                  spreadRadius: 1.0,
                                ), //BoxShadow
                                //BoxShadow
                              ],
                              color: const Color.fromARGB(255, 247, 255, 252),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Option $option",
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const Text(
                                          "2 Hours",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                right: 20.0, left: 8),
                                            child: CircleAvatar(
                                              backgroundColor: Color.fromARGB(
                                                  31, 0, 105, 70),
                                              child: Icon(
                                                IonIcons.bus,
                                                size: 26,
                                                color: Color.fromARGB(
                                                    255, 0, 88, 58),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                Number,
                                                style: const TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(
                                                route,
                                                style: const TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 30.0),
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.22,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.04,
                                              child: Visibility(
                                                visible: track,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    // ignore: avoid_print
                                                    // Get a reference to the database
                                                    _dbRef = FirebaseDatabase
                                                        .instance
                                                        .ref(widget.route)
                                                        .child('$index');

                                                    // Listen for changes in the data
                                                    _dbRef
                                                        .child('lat')
                                                        .onValue
                                                        .listen((event) {
                                                      setState(() {
                                                        _lat = event
                                                            .snapshot.value;
                                                      });
                                                    });

                                                    // Listen for changes in the data
                                                    _dbRef
                                                        .child('lon')
                                                        .onValue
                                                        .listen((event) {
                                                      setState(() {
                                                        _lon = event
                                                            .snapshot.value;
                                                      });
                                                    });
                                                    Navigator.push(
                                                      context,
                                                      PageTransition(
                                                        type: PageTransitionType
                                                            .rightToLeftWithFade,
                                                        child: BusMap(
                                                            route:
                                                                '${widget.route}',
                                                            index: index,
                                                            latitude: _lat,
                                                            longitude: _lon),
                                                      ),
                                                    );
                                                  },
                                                  // ignore: sort_child_properties_last
                                                  child: const Text(
                                                    'Track',
                                                    style: TextStyle(
                                                      fontFamily: "Poppins",
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        const Color.fromARGB(
                                                            255, 217, 248, 235),
                                                    elevation: 2,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Start : $STime",
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const Text(
                                          "End : 02.00 PM",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

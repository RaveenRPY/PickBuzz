import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pickbuzz/screens/booking_page.dart';
import 'package:pickbuzz/screens/home_Screen.dart';
import 'package:pickbuzz/screens/map_page.dart';
import 'package:pickbuzz/screens/search_page.dart';

class BusDetails extends StatefulWidget {
  final String number;
  final String route;
  final String dTime;
  final bool track;
  final int index;
  final String bus;
  final String trip;
  final double latitude;
  final double longitude;

  const BusDetails({
    super.key,
    required this.number,
    required this.route,
    required this.dTime,
    required this.track,
    required this.index,
    required this.bus,
    required this.trip,
    required this.latitude,
    required this.longitude,
  });

  @override
  State<BusDetails> createState() => _BusDetailsState();
}

class _BusDetailsState extends State<BusDetails> {
  String track = "Unavailable";

  @override
  void initState() {
    super.initState();

    if (widget.track) {
      track = "Available";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 5,
        title: const Text(
          "Bus Details",
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
        elevation: 10,
        shadowColor: const Color.fromARGB(255, 154, 255, 233),
        onDestinationSelected: (int index) {
          if (index == 0) {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: const HomePage(),
              ),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: const SearchPage(),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: const SearchPage(),
              ),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: const SearchPage(),
              ),
            );
          }
        },
        selectedIndex: 1,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.search),
            icon: Icon(Icons.search_rounded),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.location_on_rounded),
            icon: Icon(Icons.location_on_outlined),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.airplane_ticket_rounded),
            icon: Icon(Icons.airplane_ticket_outlined),
            label: '',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset("lib/assets/Search/bus1.webp")),
            ),
            Text(
              widget.number,
              style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 35,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              widget.route,
              style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Divider(
                thickness: 1,
                color: Color.fromARGB(99, 0, 48, 33),
                indent: 20,
                endIndent: 20,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Departure Time : ",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          widget.dTime,
                          style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Arrival Time : ",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "10.00 AM",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Full Trip Time : ",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "02 Hours",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Tracking Status : ",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          track,
                          style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 30.0,
                horizontal: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    width: 160,
                    child: ElevatedButton(
                      onPressed: () {
                        print("${widget.index}"
                            "-"
                            "${widget.route}"
                            "-"
                            "${widget.bus}");
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeftWithFade,
                            child: BookSeats(
                              index: widget.index + 1,
                              number: widget.number,
                              route: widget.bus,
                              trip: widget.trip,
                              time: widget.dTime,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 141, 0, 206),
                        elevation: 3,
                      ),
                      child: const Text(
                        "Book Seats",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: widget.track,
                    child: SizedBox(
                      height: 50,
                      width: 160,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeftWithFade,
                                child: BusMap(
                                    route: widget.route,
                                    index: widget.index,
                                    latitude: widget.latitude,
                                    longitude: widget.longitude),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 0, 79, 182),
                            elevation: 3,
                          ),
                          child: const Text(
                            "Track Bus",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

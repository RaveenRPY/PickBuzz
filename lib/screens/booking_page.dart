import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class BookSeats extends StatefulWidget {
  final String trip;
  final String route;
  final int index;
  final String number;
  final String time;

  const BookSeats({
    super.key,
    required this.trip,
    required this.route,
    required this.index,
    required this.number,
    required this.time,
  });

  @override
  State<BookSeats> createState() => _BookSeatsState();
}

class _BookSeatsState extends State<BookSeats> {
  var countSeatLeft = 2 * 10;
  var countSeatRight = 3 * 10;
  var listSeatLeft = [];
  var listSeatRight = [];
  int count = 0;

  @override
  void initState() {
    initSeatValueToLoist(listSeatLeft, countSeatLeft, "L");
    initSeatValueToLoist(listSeatRight, countSeatRight, "R");
    fetchSeatStatus();
    super.initState();
  }

  initSeatValueToLoist(List data, count, side) {
    Map<String, dynamic> objectData;
    for (int i = 0; i < count; i++) {
      objectData = {
        "id": side + "${i + 1}",
        "isBooked": false,
        "isAvailable": true,
        "isSelected": false,
      };
      setState(() {
        data.add(objectData);
      });
    }
  }

  setSelectedToBook() {
    int i = 0;
    for (var seat in listSeatLeft) {
      if (seat["isSelected"]) {
        setState(() {
          i++;
          seat["isBooked"] = true;
          seat["isAvailable"] = false;
          updateSeatFirestore(seat["id"], true, false);
        });
      }
    }
    for (var seat in listSeatRight) {
      if (seat["isSelected"]) {
        setState(() {
          i++;
          seat["isBooked"] = true;
          seat["isAvailable"] = false;
          updateSeatFirestore(seat["id"], true, false);
        });
      }
    }
    setState(() {
      count = i;
    });
  }

  Future<void> fetchSeatStatus() async {
    CollectionReference collection = FirebaseFirestore.instance
        .collection("Routes")
        .doc(widget.trip)
        .collection(widget.route)
        .doc('${widget.index}')
        .collection("Seats");

    QuerySnapshot querySnapshot = await collection.get();

    for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> seatData =
          documentSnapshot.data() as Map<String, dynamic>;
      String seatId = seatData['id'];
      bool isBooked = seatData['isBooked'];
      bool isAvailable = seatData['isAvailable'];

      // Update listSeatLeft or listSeatRight based on the "id" of the seat
      for (var seat in listSeatLeft) {
        if (seat['id'] == seatId) {
          setState(() {
            seat['isBooked'] = isBooked;
            seat['isAvailable'] = isAvailable;
          });
          break;
        }
      }

      for (var seat in listSeatRight) {
        if (seat['id'] == seatId) {
          setState(() {
            seat['isBooked'] = isBooked;
            seat['isAvailable'] = isAvailable;
          });
          break;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("lib/assets/Search/seat.webp"),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 5),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 110.0),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: 60,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(150, 92, 0, 95),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "BOOKING",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontSize: 52,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 180.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.93,
                                height: 70,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(148, 132, 0, 158),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          margin: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 80, 42, 90)),
                                          ),
                                        ),
                                        const Text(
                                          "Available Seat",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontFamily: "Poppins",
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          margin: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                200, 193, 150, 207),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 80, 42, 90)),
                                          ),
                                        ),
                                        const Text(
                                          "Selected Seat",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Poppins",
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          margin: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 126, 0, 165),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 80, 42, 90)),
                                          ),
                                        ),
                                        const Text(
                                          "Booked Seat",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Poppins",
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 80,
                                child: widgetLeft(listSeatLeft),
                              ),
                              SizedBox(
                                width: 120,
                                child: widgetRight(listSeatRight),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 141, 0, 206),
                      elevation: 3,
                    ),
                    onPressed: () {
                      setSelectedToBook();
                      bookReciept(context, count);
                    },
                    child: const Text(
                      "Book Seats",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontFamily: "Poppins",
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget widgetLeft(List dataSeat) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: listSeatLeft.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              dataSeat[index]["isSelected"] = !dataSeat[index]["isSelected"];
            });
          },
          child: Container(
            margin: const EdgeInsets.all(5),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                color: dataSeat[index]["isBooked"]
                    ? const Color.fromARGB(255, 126, 0, 165)
                    : dataSeat[index]["isSelected"]
                        ? const Color.fromARGB(200, 193, 150, 207)
                        : Colors.transparent,
                border:
                    Border.all(color: const Color.fromARGB(150, 80, 42, 90)),
                borderRadius: BorderRadius.circular(8)),
          ),
        );
      },
    );
  }

  Widget widgetRight(List dataSeat) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: listSeatRight.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              dataSeat[index]["isSelected"] = !dataSeat[index]["isSelected"];
            });
          },
          child: Container(
            margin: const EdgeInsets.all(5),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                color: dataSeat[index]["isBooked"]
                    ? const Color.fromARGB(255, 126, 0, 165)
                    : dataSeat[index]["isSelected"]
                        ? const Color.fromARGB(200, 193, 150, 207)
                        : Colors.transparent,
                border:
                    Border.all(color: const Color.fromARGB(150, 80, 42, 90)),
                borderRadius: BorderRadius.circular(8)),
          ),
        );
      },
    );
  }

  void saveSeatsToFirestore() async {
    CollectionReference collection = FirebaseFirestore.instance
        .collection("Routes")
        .doc(widget.trip)
        .collection(widget.route)
        .doc('${widget.index}')
        .collection("Seats");

    // Save listSeatLeft to Firestore
    for (var seat in listSeatLeft) {
      await collection.add(seat);
    }

    // Save listSeatRight to Firestore
    for (var seat in listSeatRight) {
      await collection.add(seat);
    }
  }

  Future<void> updateSeatFirestore(
      String seatId, bool isBooked, bool isAvailable) async {
    CollectionReference collection = FirebaseFirestore.instance
        .collection("Routes")
        .doc(widget.trip)
        .collection(widget.route)
        .doc('${widget.index}')
        .collection("Seats");

    QuerySnapshot querySnapshot =
        await collection.where("id", isEqualTo: seatId).get();

    Map<String, dynamic> newData = {
      'isBooked': isBooked,
      'isAvailable': isAvailable,
      // Add other fields you want to update
    };

    for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
      await documentSnapshot.reference.update(newData);
    }
  }

  void bookReciept(BuildContext context, int count) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: const Color.fromARGB(255, 1, 10, 92).withOpacity(0.2),
      transitionDuration: const Duration(milliseconds: 300),
      //ignore: avoid_unnecessary_containers
      pageBuilder: (_, __, ___) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GlassmorphicFlexContainer(
              borderRadius: 0,
              blur: 15,
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              alignment: Alignment.bottomCenter,
              border: 2,
              linearGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0x0fffffff).withAlpha(0),
                    const Color(0x0fffffff).withAlpha(0),
                  ],
                  stops: const [
                    0.3,
                    1,
                  ]),
              borderGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0x0fffffff).withAlpha(01),
                  const Color(0x0fffffff).withAlpha(100),
                  const Color(0x0fffffff).withAlpha(01),
                ],
                stops: const [
                  0.2,
                  0.9,
                  1,
                ],
              ),
              child: Center(
                child: Container(
                  width: 300,
                  height: 450,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(50, 69, 6, 85),
                          offset: Offset(
                            0.0,
                            5.0,
                          ),
                          blurRadius: 10.0,
                          spreadRadius: 1.0,
                        ),
                      ]),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(50, 255, 236, 254),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(
                                  Icons.close_rounded,
                                  color: Color.fromARGB(150, 56, 0, 58),
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40.0),
                        child: Column(
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Color.fromARGB(255, 127, 3, 146),
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FontStyle.italic,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Booking Successfully !',
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            Material(
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "$count Seats",
                                    style: const TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    widget.trip,
                                    style: const TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        widget.number,
                                        style: const TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        widget.time,
                                        style: const TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 45,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: Image.asset(
                                        "lib/assets/Search/success.webp",
                                        fit: BoxFit.fitWidth),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;

        tween = Tween(begin: const Offset(0, -1), end: Offset.zero);

        return SlideTransition(
          position: tween.animate(
            CurvedAnimation(parent: anim, curve: Curves.easeInOut),
          ),
          child: child,
        );
      },
    );
  }
}

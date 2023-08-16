import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pickbuzz/screens/bus_list.dart';
import 'package:pickbuzz/screens/home_Screen.dart';

class LocatePage extends StatefulWidget {
  const LocatePage({Key? key}) : super(key: key);

  @override
  State<LocatePage> createState() => _LocatePageState();
}

class _LocatePageState extends State<LocatePage> with TickerProviderStateMixin {
  late AnimationController _animationController1;
  late Animation<double> _scaleAnimation1;
  late AnimationController _animationController2;
  late Animation<double> _scaleAnimation2;
  late AnimationController _animationController3;
  late Animation<double> _scaleAnimation3;
  late AnimationController _animationController4;
  late Animation<double> _scaleAnimation4;
  late AnimationController _animationController5;
  late Animation<double> _scaleAnimation5;
  late AnimationController _animationController6;
  late Animation<double> _scaleAnimation6;

  @override
  void initState() {
    super.initState();

    _animationController1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _scaleAnimation1 = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(
        parent: _animationController1,
        curve: Curves.easeInOut,
      ),
    );

    _animationController2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _scaleAnimation2 = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(
        parent: _animationController2,
        curve: Curves.easeInOut,
      ),
    );

    _animationController3 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _scaleAnimation3 = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(
        parent: _animationController3,
        curve: Curves.easeInOut,
      ),
    );

    _animationController4 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _scaleAnimation4 = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(
        parent: _animationController4,
        curve: Curves.easeInOut,
      ),
    );

    _animationController5 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _scaleAnimation5 = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(
        parent: _animationController5,
        curve: Curves.easeInOut,
      ),
    );

    _animationController6 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _scaleAnimation6 = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(
        parent: _animationController6,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController1.dispose();
    _animationController2.dispose();
    _animationController3.dispose();
    _animationController4.dispose();
    _animationController5.dispose();
    _animationController6.dispose();
    super.dispose();
  }

  void _onTapDown1() {
    _animationController1.forward();
  }

  void _onTapUp1() {
    _animationController1.reverse();
  }

  void _onTapCancel1() {
    _animationController1.reverse();
  }

  void _onTapDown2() {
    _animationController2.forward();
  }

  void _onTapUp2() {
    _animationController2.reverse();
  }

  void _onTapCancel2() {
    _animationController2.reverse();
  }

  void _onTapDown3() {
    _animationController3.forward();
  }

  void _onTapUp3() {
    _animationController3.reverse();
  }

  void _onTapCancel3() {
    _animationController3.reverse();
  }

  void _onTapDown4() {
    _animationController4.forward();
  }

  void _onTapUp4() {
    _animationController4.reverse();
  }

  void _onTapCancel4() {
    _animationController4.reverse();
  }

  void _onTapDown5() {
    _animationController5.forward();
  }

  void _onTapUp5() {
    _animationController5.reverse();
  }

  void _onTapCancel5() {
    _animationController5.reverse();
  }

  void _onTapDown6() {
    _animationController6.forward();
  }

  void _onTapUp6() {
    _animationController6.reverse();
  }

  void _onTapCancel6() {
    _animationController6.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 5,
        title: const Text(
          "Locate Bus",
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
                child: const LocatePage(),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: const LocatePage(),
              ),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: const LocatePage(),
              ),
            );
          }
        },
        selectedIndex: 2,
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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: GestureDetector(
                    onTapDown: (_) => _onTapDown1(),
                    onTapUp: (_) => _onTapUp1(),
                    onTapCancel: () => _onTapCancel1(),
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: const BusList(
                            route: "Bus-CK",
                            startStop: "Colombo",
                            endStop: "Kurunegala",
                          ),
                        ),
                      );
                    },
                    child: ScaleTransition(
                      scale: _scaleAnimation1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 242, 208, 255),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: double.infinity,
                        height: 70,
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Colombo - Kurunegala",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: "Poppins",
                                  color: Color(0xff861cb0),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: GestureDetector(
                    onTapDown: (_) => _onTapDown2(),
                    onTapUp: (_) => _onTapUp2(),
                    onTapCancel: () => _onTapCancel2(),
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: const BusList(
                            route: "Bus-CM",
                            startStop: "Colombo",
                            endStop: "Mirigama",
                          ),
                        ),
                      );
                    },
                    child: ScaleTransition(
                      scale: _scaleAnimation2,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 208, 215, 255),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: double.infinity,
                        height: 70,
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Colombo - Mirigama",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: "Poppins",
                                  color: Color(0xff2c3582),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: GestureDetector(
                    onTapDown: (_) => _onTapDown3(),
                    onTapUp: (_) => _onTapUp3(),
                    onTapCancel: () => _onTapCancel3(),
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: const BusList(
                            route: "Bus-DK",
                            startStop: "Kadawatha",
                            endStop: "Kurunegala",
                          ),
                        ),
                      );
                    },
                    child: ScaleTransition(
                      scale: _scaleAnimation3,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 245, 208),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: double.infinity,
                        height: 70,
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Kadawatha - Kurunegala",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: "Poppins",
                                  color: Color.fromARGB(255, 187, 140, 0),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: GestureDetector(
                    onTapDown: (_) => _onTapDown4(),
                    onTapUp: (_) => _onTapUp4(),
                    onTapCancel: () => _onTapCancel4(),
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: const BusList(
                            route: "Bus-KC",
                            startStop: "Kurunegala",
                            endStop: "Colombo",
                          ),
                        ),
                      );
                    },
                    child: ScaleTransition(
                      scale: _scaleAnimation4,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 209, 253, 226),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: double.infinity,
                        height: 70,
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Kurunegala - Colombo",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: "Poppins",
                                  color: Color.fromARGB(255, 1, 129, 54),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: GestureDetector(
                    onTapDown: (_) => _onTapDown5(),
                    onTapUp: (_) => _onTapUp5(),
                    onTapCancel: () => _onTapCancel5(),
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: const BusList(
                            route: "Bus-MC",
                            startStop: "Mirigama",
                            endStop: "Colombo",
                          ),
                        ),
                      );
                    },
                    child: ScaleTransition(
                      scale: _scaleAnimation5,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 208, 208),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: double.infinity,
                        height: 70,
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Mirigama - Colombo",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: "Poppins",
                                  color: Color.fromARGB(255, 176, 28, 28),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: GestureDetector(
                    onTapDown: (_) => _onTapDown6(),
                    onTapUp: (_) => _onTapUp6(),
                    onTapCancel: () => _onTapCancel6(),
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: const BusList(
                            route: "Bus-KD",
                            startStop: "Kurunegala",
                            endStop: "Kadawatha",
                          ),
                        ),
                      );
                    },
                    child: ScaleTransition(
                      scale: _scaleAnimation6,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 208, 251),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: double.infinity,
                        height: 70,
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Kurunegala - Kadawatha",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: "Poppins",
                                  color: Color.fromARGB(255, 176, 28, 156),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

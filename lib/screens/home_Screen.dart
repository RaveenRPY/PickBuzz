import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pickbuzz/screens/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _animationController1;
  late Animation<double> _scaleAnimation1;
  late AnimationController _animationController2;
  late Animation<double> _scaleAnimation2;
  late AnimationController _animationController3;
  late Animation<double> _scaleAnimation3;

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
  }

  @override
  void dispose() {
    _animationController1.dispose();
    _animationController2.dispose();
    _animationController3.dispose();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      drawer: const SafeArea(child: Drawer()),
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 5,
        title: const Text(
          "Wijerama, Nugegoda",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Color.fromARGB(255, 0, 0, 0)),
              onPressed: () {
                Scaffold.of(context).openDrawer();
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
        selectedIndex: 0,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.person_outline),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.engineering),
            icon: Icon(Icons.engineering_outlined),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_border),
            label: '',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hi, Raveen !",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    "Good Morning",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 199, 199, 199),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: GestureDetector(
                      onTapDown: (_) => _onTapDown1(),
                      onTapUp: (_) => _onTapUp1(),
                      onTapCancel: () => _onTapCancel1(),
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.bottomToTop,
                            child: const SearchPage(),
                          ),
                        );
                      },
                      child: ScaleTransition(
                        scale: _scaleAnimation1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 242, 208, 255),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: double.infinity,
                          height: 120,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.575,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: const TextSpan(
                                            style: TextStyle(
                                              fontSize: 22,
                                              fontFamily: "Poppins",
                                              color: Color(0xff861cb0),
                                              fontWeight: FontWeight.w600,
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'Find your Bus',
                                              ),
                                            ],
                                          ),
                                        ),
                                        RichText(
                                          text: const TextSpan(
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "Poppins",
                                              color: Color.fromARGB(
                                                  255, 49, 10, 65),
                                              fontWeight: FontWeight.w300,
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:
                                                    'Get your bus by searching Routes',
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Image.asset(
                                    "lib/assets/Home/Find.webp",
                                  ),
                                )
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
                        // Perform your desired action here
                        // This code will execute when the widget is pressed
                      },
                      child: ScaleTransition(
                        scale: _scaleAnimation2,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 197, 224, 255),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: double.infinity,
                          height: 120,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.575,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: const TextSpan(
                                            style: TextStyle(
                                              fontSize: 22,
                                              fontFamily: "Poppins",
                                              color: Color(0xff2c3582),
                                              fontWeight: FontWeight.w600,
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'Locate your Bus',
                                              ),
                                            ],
                                          ),
                                        ),
                                        RichText(
                                          text: const TextSpan(
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "Poppins",
                                              color: Color.fromARGB(
                                                  255, 17, 20, 49),
                                              fontWeight: FontWeight.w300,
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:
                                                    'Track your bus & find where it is',
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Image.asset(
                                    "lib/assets/Home/TrackBus.webp",
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
                        // Perform your desired action here
                        // This code will execute when the widget is pressed
                      },
                      child: ScaleTransition(
                        scale: _scaleAnimation3,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 245, 208),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: double.infinity,
                          height: 120,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 0.0),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.575,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: const TextSpan(
                                            style: TextStyle(
                                              fontSize: 22,
                                              fontFamily: "Poppins",
                                              color: Color.fromARGB(
                                                  255, 230, 172, 0),
                                              fontWeight: FontWeight.w600,
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'Book your Seats',
                                              ),
                                            ],
                                          ),
                                        ),
                                        RichText(
                                          text: const TextSpan(
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "Poppins",
                                              color: Color.fromARGB(
                                                  255, 61, 46, 0),
                                              fontWeight: FontWeight.w300,
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:
                                                    'Keep your seats by booking via PickBuzz',
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 110,
                                  height: 77,
                                  child: Image.asset(
                                    "lib/assets/Home/Ticket.webp",
                                  ),
                                )
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
            const Padding(
              padding: EdgeInsets.only(
                left: 15.0,
                right: 15,
                top: 15,
              ),
              child: Row(
                children: [
                  Text(
                    "Bus Stoppages",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: SizedBox(
                height: 130,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 15.0, right: 5.0),
                      width: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Stack(
                          children: [
                            SizedBox(
                              width: 200,
                              height: 130,
                              child: Image.asset(
                                "lib/assets/Home/colombo.webp",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned.fill(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Colombo',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      width: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Stack(
                          children: [
                            SizedBox(
                              width: 200,
                              height: 130,
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    Color.fromARGB(255, 0, 116, 81)
                                        .withOpacity(0.2),
                                    BlendMode.srcATop),
                                child: Image.asset(
                                  "lib/assets/Home/kadawatha.webp",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Kadawatha',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      width: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Stack(
                          children: [
                            SizedBox(
                              width: 200,
                              height: 130,
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    Color.fromARGB(255, 150, 204, 0)
                                        .withOpacity(0.1),
                                    BlendMode.srcATop),
                                child: Image.asset(
                                  "lib/assets/Home/mirigama.webp",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Mirigama',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      width: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Stack(
                          children: [
                            SizedBox(
                              width: 200,
                              height: 130,
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    Color.fromARGB(255, 97, 97, 97)
                                        .withOpacity(0.5),
                                    BlendMode.srcATop),
                                child: Image.asset(
                                  "lib/assets/Home/kurunegala.webp",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Kurunegala',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 15.0,
                right: 15,
                top: 15,
              ),
              child: Row(
                children: [
                  Text(
                    "Top Buses",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: SizedBox(
                height: 130,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 15.0, right: 5.0),
                      width: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Stack(
                          children: [
                            SizedBox(
                              width: 200,
                              height: 130,
                              child: Image.asset(
                                "lib/assets/Home/colombo.webp",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned.fill(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Colombo',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      width: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Stack(
                          children: [
                            SizedBox(
                              width: 200,
                              height: 130,
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    Color.fromARGB(255, 0, 116, 81)
                                        .withOpacity(0.2),
                                    BlendMode.srcATop),
                                child: Image.asset(
                                  "lib/assets/Home/kadawatha.webp",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Kadawatha',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      width: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Stack(
                          children: [
                            Container(
                              width: 200,
                              height: 130,
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    Color.fromARGB(255, 150, 204, 0)
                                        .withOpacity(0.1),
                                    BlendMode.srcATop),
                                child: Image.asset(
                                  "lib/assets/Home/mirigama.webp",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Mirigama',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      width: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Stack(
                          children: [
                            Container(
                              width: 200,
                              height: 130,
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    Color.fromARGB(255, 97, 97, 97)
                                        .withOpacity(0.5),
                                    BlendMode.srcATop),
                                child: Image.asset(
                                  "lib/assets/Home/kurunegala.webp",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Kurunegala',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

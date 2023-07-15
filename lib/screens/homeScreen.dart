import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

// ignore: camel_case_types
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   const SystemUiOverlayStyle(
    //     statusBarColor: Color.fromARGB(255, 0, 0, 0),
    //     statusBarIconBrightness: Brightness.light,
    //     systemNavigationBarColor: Color.fromARGB(255, 245, 0, 0),
    //     systemNavigationBarDividerColor: Color.fromARGB(0, 255, 0, 0),
    //   ),
    // );
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: [SystemUiOverlay.top]);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      drawer: Drawer(),
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
        shadowColor: Color.fromARGB(40, 154, 255, 233),
        centerTitle: true,
      ),
      bottomNavigationBar: NavigationBar(
        surfaceTintColor: Colors.white,
        elevation: 0,
        shadowColor: Color.fromARGB(255, 154, 255, 233),
        onDestinationSelected: (int index) {
          print('Selected $index');
        },
        selectedIndex: 0,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
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
      body: const Stack(
        children: [],
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pickbuzz/screens/login_form.dart';
import 'package:pickbuzz/screens/start.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  void _incrementCounter() {
    setState(
      () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color.fromARGB(6, 0, 0, 0),
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            foregroundDecoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/main/BG2.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(130, 6, 83, 92),
                  Colors.transparent,
                  Colors.transparent,
                  Color.fromARGB(130, 6, 83, 92),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50, sigmaY: 100),
              child: const SizedBox(),
            ),
          ),
          Container(
            color: const Color.fromARGB(45, 0, 36, 30),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(0.5),
                child: Divider(
                  height: 0.5,
                  thickness: 0.8,
                  color: Color.fromARGB(66, 255, 255, 255),
                ),
              ),
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.arrow_back_ios_rounded,
                        color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  );
                },
              ),
              toolbarHeight: 80,
              foregroundColor: Colors.amber,
              elevation: 20,
              centerTitle: true,
              title: const Text(
                "Log in",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
              backgroundColor: Colors.transparent,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Add some spacing between the GlassmorphicFlexContainer and the "Sign In" text
                  const // Add spacing between the "Sign In" text and other content
                  // Add your login form widget or content here

                  SignInForm(),

                  const Padding(
                    padding: EdgeInsets.only(top: 60.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "OR",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              fontFamily: "Intel",
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 40, bottom: 30),
                    child: Center(
                      child: Text(
                        "Sign up with Email, Apple or Google",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                          fontSize: 18,
                          fontFamily: "Intel",
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        child: Logo(
                          Logos.gmail,
                          size: 35,
                        ),
                        onTapDown: (details) {
                          // ignore: avoid_print
                          print("Pressed Email");
                        },
                      ),
                      GestureDetector(
                        child: Logo(
                          Logos.apple,
                          size: 35,
                          colorFilter: const ColorFilter.linearToSrgbGamma(),
                        ),
                        onTapDown: (details) {
                          // ignore: avoid_print
                          print("Pressed Apple");
                        },
                      ),
                      GestureDetector(
                        child: Logo(
                          Logos.google,
                          size: 35,
                        ),
                        onTapDown: (details) {
                          // ignore: avoid_print
                          print("Pressed Google");
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     Container(
          //       height: MediaQuery.of(context).size.height * 0.35,
          //       width: MediaQuery.of(context).size.width,
          //       decoration: const BoxDecoration(
          //         gradient: LinearGradient(
          //           begin: Alignment.bottomCenter,
          //           end: Alignment.topCenter,
          //           colors: [
          //             Color.fromARGB(200, 3, 59, 63),
          //             Colors.transparent,
          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}

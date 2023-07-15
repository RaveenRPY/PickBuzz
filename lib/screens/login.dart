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

// ignore: camel_case_types
class _loginPageState extends State<loginPage> {
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
      backgroundColor: const Color.fromARGB(255, 5, 90, 57),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/assets/main/BG2.jpg"),
                  fit: BoxFit.fill,
                ),
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
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Add some spacing between the GlassmorphicFlexContainer and the "Sign In" text
                      const // Add spacing between the "Sign In" text and other content
                      // Add your login form widget or content here

                      SignInForm(),

                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              child: const Icon(
                                IonIcons.logo_google,
                                size: 35,
                                color: Color.fromARGB(220, 255, 255, 255),
                              ),
                              onTapDown: (details) {
                                // ignore: avoid_print
                                print("Pressed Google");
                              },
                            ),
                            GestureDetector(
                              child: const Icon(
                                IonIcons.logo_facebook,
                                size: 35,
                                color: Color.fromARGB(220, 255, 255, 255),
                              ),
                              onTapDown: (details) {
                                // ignore: avoid_print
                                print("Pressed Google");
                              },
                            ),
                            GestureDetector(
                              child: const Icon(
                                IonIcons.logo_linkedin,
                                size: 35,
                                color: Color.fromARGB(220, 255, 255, 255),
                              ),
                              onTapDown: (details) {
                                // ignore: avoid_print
                                print("Pressed Google");
                              },
                            ),
                          ],
                        ),
                      ),

                      const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 50),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.white,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Center(
                        child: Text(
                          "Don't have an account ?",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w200,
                            fontSize: 14,
                            fontFamily: "Intel",
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Center(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Create an Account",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                              fontFamily: "Intel",
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
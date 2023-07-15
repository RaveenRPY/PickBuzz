import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pickbuzz/button.dart';
import 'package:pickbuzz/screens/login.dart';

class startPage extends StatefulWidget {
  const startPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<startPage> createState() => _startPageState();
}

class _startPageState extends State<startPage> {
  void _incrementCounter() {
    setState(() {});
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
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            children: [
              Container(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                foregroundDecoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/assets/main/BG1.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
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
                  filter: ImageFilter.blur(sigmaX: 50, sigmaY: 70),
                  child: const SizedBox(),
                ),
              ),
              // Container(
              //   color: Color.fromARGB(45, 0, 36, 30),
              // ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: constraints.maxHeight * 0.35,
                    width: constraints.maxWidth,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Color.fromARGB(200, 3, 59, 63),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        top: constraints.maxHeight * 0.05,
                        bottom: constraints.maxHeight * 0.1,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: constraints.maxHeight * 0.10,
                            width: constraints.maxWidth * 0.95,
                            foregroundDecoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("lib/assets/main/Logo.png"),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: constraints.maxHeight * 0.35,
                          width: constraints.maxWidth * 0.8,
                          foregroundDecoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("lib/assets/main/busb2.png"),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: constraints.maxHeight * 0.00,
                            bottom: constraints.maxHeight * 0.01,
                          ),
                          child: Container(
                            width: constraints.maxWidth * 0.97,
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                style: TextStyle(
                                  fontSize: 32,
                                  color: Color.fromARGB(255, 0, 20, 15),
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w600,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Ready to hit the road ?',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: constraints.maxWidth * 0.85,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 19,
                                color: Color.fromARGB(255, 190, 255, 239),
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w300,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      'Find the best way to you destination and ',
                                ),
                                TextSpan(
                                  text: 'enjoy ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: 'the city !',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: constraints.maxHeight * 0.1,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        StartButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeftWithFade,
                                child: const loginPage(title: "gfg"),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rive/rive.dart';
import 'package:pickbuzz/button.dart';
import 'dart:async';

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isShowLoading = false;
  bool isShowConfetti = false;
  late SMITrigger error;
  late SMITrigger success;
  late SMITrigger reset;

  late SMITrigger confetti;

  void _onCheckRiveInit(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');

    artboard.addController(controller!);
    error = controller.findInput<bool>('Error') as SMITrigger;
    success = controller.findInput<bool>('Check') as SMITrigger;
    reset = controller.findInput<bool>('Reset') as SMITrigger;
  }

  void _onConfettiRiveInit(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, "State Machine 1");
    artboard.addController(controller!);

    confetti = controller.findInput<bool>("Trigger explosion") as SMITrigger;
  }

  void singIn(BuildContext context) {
    // confetti.fire();
    setState(() {
      isShowConfetti = true;
      isShowLoading = true;
    });
    Timer(
      const Duration(seconds: 1),
      () {
        if (_formKey.currentState!.validate()) {
          success.fire();
          Timer(
            const Duration(seconds: 2),
            () {
              setState(() {
                isShowLoading = false;
              });
              confetti.fire();
              // Navigate & hide confetti
              Timer(const Duration(seconds: 1), () {
                // Navigator.pop(context);
              });
            },
          );
        } else {
          error.fire();
          Timer(
            const Duration(seconds: 2),
            () {
              setState(() {
                isShowLoading = false;
              });
              reset.fire();
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 30,
        ),
        child: Stack(
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Intel",
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 16),
                    child: TextFormField(
                      cursorHeight: 18,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 0, 39, 27),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Enter Email",
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelStyle: const TextStyle(
                          color: Color.fromARGB(155, 0, 0, 0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 255, 0, 0),
                            width: 1.5,
                          ),
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(180, 128, 255, 227),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Icon(
                            BoxIcons.bx_message_detail,
                            color: Color.fromARGB(153, 0, 0, 0),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(61, 0, 245, 245),
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: Colors.amberAccent,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Intel",
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 0),
                    child: TextFormField(
                      obscureText: true,
                      cursorHeight: 18,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 0, 39, 27),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enetrerer";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        fillColor: const Color.fromARGB(180, 128, 255, 227),
                        labelText: "Enter Password",
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 255, 0, 0),
                            width: 1.5,
                          ),
                        ),
                        labelStyle: const TextStyle(
                            color: Color.fromARGB(155, 0, 54, 29)),
                        counterText: (' '),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Icon(
                            BoxIcons.bx_lock,
                            color: Color.fromARGB(153, 0, 0, 0),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(61, 0, 245, 245),
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: Colors.amberAccent,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                            bottom: 30,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              print("Forget password ?");

                              // Navigator.pushNamed(context, "write your route");
                            },
                            child: const Text(
                              "Forget password ?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          )),
                    ],
                  ),
                  Center(
                    // child: SignButton(
                    //   color1: const Color(0xff47b5fb),
                    //   color2: const Color(0xff57e3eb),
                    //   onPressed: () {},
                    // ),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        side: const BorderSide(
                            width: 2,
                            color: Color.fromARGB(255, 189, 255, 241)),
                      ),
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 100.0, vertical: 14),
                        child: Text(
                          'Log in',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 8, bottom: 24),
                  //   child:
                  // ),
                ],
              ),
            ),
            isShowLoading
                ? CustomPositioned(
                    child: RiveAnimation.asset(
                      'lib/assets/RiveAssets/check.riv',
                      fit: BoxFit.cover,
                      onInit: _onCheckRiveInit,
                    ),
                  )
                : const SizedBox(),
            isShowConfetti
                ? CustomPositioned(
                    scale: 6,
                    child: RiveAnimation.asset(
                      "lib/assets/RiveAssets/confetti.riv",
                      onInit: _onConfettiRiveInit,
                      fit: BoxFit.cover,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class CustomPositioned extends StatelessWidget {
  const CustomPositioned({super.key, this.scale = 1, required this.child});

  final double scale;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          const Spacer(),
          SizedBox(
            height: 100,
            width: 100,
            child: Transform.scale(
              scale: scale,
              child: child,
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}

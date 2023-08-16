import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pickbuzz/screens/login_form.dart';

// ignore: camel_case_types
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
              scrolledUnderElevation: 20,
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(0.5),
                child: Divider(
                  height: 0.5,
                  thickness: 0.8,
                  color: Color.fromARGB(66, 255, 255, 255),
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_rounded,
                    color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              toolbarHeight: 80,
              foregroundColor: Colors.amber,
              elevation: 20,
              centerTitle: true,
              title: const Text(
                "Log In",
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: "Poppins",
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
                      const SizedBox(
                        width: 200,
                        height: 50,
                      ),
                      const SignInForm(),
                      const Padding(
                        padding:
                            EdgeInsets.only(top: 30.0, left: 20, right: 20),
                        child: SocialMediaIcons(),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 50),
                        child: Divider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                      ),
                      const Center(
                        child: Text(
                          "Don't have an account ?",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w200,
                            fontSize: 14,
                            fontFamily: "Poppins",
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Center(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 22),
                          ),
                          onPressed: () {
                            // Handle "Create an Account" button tap
                          },
                          child: const Text(
                            "Create an Account",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 22,
                              fontFamily: "Poppins",
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 200,
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () => signInWithGoogle(context),
          child: const Icon(
            IonIcons.logo_google,
            size: 35,
            color: Color.fromARGB(220, 255, 255, 255),
          ),
        ),
        InkWell(
          onTap: () {
            // Handle Facebook login
          },
          child: const Icon(
            IonIcons.logo_facebook,
            size: 35,
            color: Color.fromARGB(220, 255, 255, 255),
          ),
        ),
        InkWell(
          onTap: () {
            // Handle LinkedIn login
          },
          child: const Icon(
            IonIcons.logo_linkedin,
            size: 35,
            color: Color.fromARGB(220, 255, 255, 255),
          ),
        ),
      ],
    );
  }

  signInWithGoogle(BuildContext context) async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    if (userCredential.user == null) {
      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }
}

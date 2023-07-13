import 'package:flutter/material.dart';

class StartButton extends StatefulWidget {
  final Color color1;
  final Color color2;
  final VoidCallback onPressed;

  // ignore: prefer_const_constructors_in_immutables
  StartButton({
    key,
    this.color1 = const Color(0xff22d99e),
    this.color2 = const Color(0xff14ba87),
    required this.onPressed,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _StartButtonState createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  var glowing = false;
  var scale = 1.0;
  @override
  Widget build(BuildContext context) {
    //On mobile devices, gesture detector is perfect
    //However for desktop and web we can show this effect on hover too
    return GestureDetector(
      onTapUp: (val) {
        setState(() {
          glowing = false;
          scale = 1.0;
        });
        widget.onPressed();
      },
      onTapDown: (val) {
        setState(() {
          glowing = true;
          scale = 1.1;
        });
      },
      child: AnimatedContainer(
        transform: Matrix4.identity()..scale(scale),
        duration: const Duration(milliseconds: 200),
        height: 48,
        width: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90),
            gradient: LinearGradient(
              colors: [
                widget.color1,
                widget.color2,
              ],
            ),
            boxShadow: glowing
                ? [
                    BoxShadow(
                      color: widget.color1.withOpacity(0.6),
                      spreadRadius: 1,
                      blurRadius: 16,
                      offset: Offset(-8, 0),
                    ),
                    BoxShadow(
                      color: widget.color2.withOpacity(0.6),
                      spreadRadius: 1,
                      blurRadius: 16,
                      offset: Offset(8, 0),
                    ),
                    BoxShadow(
                      color: widget.color1.withOpacity(0.2),
                      spreadRadius: 16,
                      blurRadius: 32,
                      offset: Offset(-8, 0),
                    ),
                    BoxShadow(
                      color: widget.color2.withOpacity(0.2),
                      spreadRadius: 16,
                      blurRadius: 32,
                      offset: Offset(8, 0),
                    )
                  ]
                : []),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              glowing
                  ? Icons.arrow_circle_right_rounded
                  : Icons.arrow_circle_right_outlined,
              color: Color.fromARGB(255, 0, 61, 48),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              glowing ? "Get Started" : "Get Started",
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 61, 48),
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}

class SignButton extends StatefulWidget {
  final Color color1;
  final Color color2;
  final VoidCallback onPressed;

  // ignore: prefer_const_constructors_in_immutables
  SignButton({
    key,
    this.color1 = Colors.cyan,
    this.color2 = Colors.greenAccent,
    required this.onPressed,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignButtonState createState() => _SignButtonState();
}

class _SignButtonState extends State<SignButton> {
  var glowing = false;
  var scale = 1.0;
  @override
  Widget build(BuildContext context) {
    //On mobile devices, gesture detector is perfect
    //However for desktop and web we can show this effect on hover too
    return GestureDetector(
      onTapUp: (val) {
        setState(() {
          glowing = false;
          scale = 1.0;
        });
        widget.onPressed();
      },
      onTapDown: (val) {
        setState(() {
          glowing = true;
          scale = 1.1;
        });
      },
      child: AnimatedContainer(
        transform: Matrix4.identity()..scale(scale),
        duration: const Duration(milliseconds: 200),
        height: 48,
        width: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90),
            gradient: LinearGradient(
              colors: [
                widget.color1,
                widget.color2,
              ],
            ),
            boxShadow: glowing
                ? [
                    BoxShadow(
                      color: widget.color1.withOpacity(0.6),
                      spreadRadius: 1,
                      blurRadius: 16,
                      offset: Offset(-8, 0),
                    ),
                    BoxShadow(
                      color: widget.color2.withOpacity(0.6),
                      spreadRadius: 1,
                      blurRadius: 16,
                      offset: Offset(8, 0),
                    ),
                    BoxShadow(
                      color: widget.color1.withOpacity(0.2),
                      spreadRadius: 16,
                      blurRadius: 32,
                      offset: Offset(-8, 0),
                    ),
                    BoxShadow(
                      color: widget.color2.withOpacity(0.2),
                      spreadRadius: 16,
                      blurRadius: 32,
                      offset: Offset(8, 0),
                    )
                  ]
                : []),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              glowing ? "Sign In" : "Sign In",
              style: const TextStyle(
                  color: Color.fromARGB(255, 0, 35, 131),
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}

class TrackButton extends StatefulWidget {
  final Color color1;
  final Color color2;
  final VoidCallback onPressed;

  // ignore: prefer_const_constructors_in_immutables
  TrackButton({
    key,
    this.color1 = Colors.cyan,
    this.color2 = Colors.greenAccent,
    required this.onPressed,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TrackButtonState createState() => _TrackButtonState();
}

class _TrackButtonState extends State<TrackButton> {
  var glowing = false;
  var scale = 1.0;
  @override
  Widget build(BuildContext context) {
    //On mobile devices, gesture detector is perfect
    //However for desktop and web we can show this effect on hover too
    return GestureDetector(
      onTapUp: (val) {
        setState(() {
          glowing = false;
          scale = 1.0;
        });
        widget.onPressed();
      },
      onTapDown: (val) {
        setState(() {
          glowing = true;
          scale = 1.1;
        });
      },
      child: AnimatedContainer(
        transform: Matrix4.identity()..scale(scale),
        duration: const Duration(milliseconds: 200),
        height: 48,
        width: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90),
            gradient: LinearGradient(
              colors: [
                widget.color1,
                widget.color2,
              ],
            ),
            boxShadow: glowing
                ? [
                    BoxShadow(
                      color: widget.color1.withOpacity(0.6),
                      spreadRadius: 1,
                      blurRadius: 16,
                      offset: Offset(-8, 0),
                    ),
                    BoxShadow(
                      color: widget.color2.withOpacity(0.6),
                      spreadRadius: 1,
                      blurRadius: 16,
                      offset: Offset(8, 0),
                    ),
                    BoxShadow(
                      color: widget.color1.withOpacity(0.2),
                      spreadRadius: 16,
                      blurRadius: 32,
                      offset: Offset(-8, 0),
                    ),
                    BoxShadow(
                      color: widget.color2.withOpacity(0.2),
                      spreadRadius: 16,
                      blurRadius: 32,
                      offset: Offset(8, 0),
                    )
                  ]
                : []),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 10,
            ),
            Text(
              glowing ? "Locate" : "Locate",
              style: const TextStyle(
                  color: Color.fromARGB(255, 0, 35, 131),
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(
              glowing
                  ? Icons.arrow_circle_right_rounded
                  : Icons.arrow_circle_right_outlined,
              color: Color.fromARGB(255, 0, 35, 131),
            ),
          ],
        ),
      ),
    );
  }
}

class DirrectionButton extends StatefulWidget {
  final Color color1;
  final Color color2;
  final VoidCallback onPressed;

  // ignore: prefer_const_constructors_in_immutables
  DirrectionButton({
    key,
    this.color1 = Colors.cyan,
    this.color2 = Colors.greenAccent,
    required this.onPressed,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DirrectionButtonState createState() => _DirrectionButtonState();
}

class _DirrectionButtonState extends State<DirrectionButton> {
  var glowing = false;
  var scale = 1.0;
  @override
  Widget build(BuildContext context) {
    //On mobile devices, gesture detector is perfect
    //However for desktop and web we can show this effect on hover too
    return GestureDetector(
      onTapUp: (val) {
        setState(() {
          glowing = false;
          scale = 1.0;
        });
        widget.onPressed();
      },
      onTapDown: (val) {
        setState(() {
          glowing = true;
          scale = 1.1;
        });
      },
      child: AnimatedContainer(
        transform: Matrix4.identity()..scale(scale),
        duration: const Duration(milliseconds: 200),
        height: 48,
        width: 130,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90),
            gradient: LinearGradient(
              colors: [
                widget.color1,
                widget.color2,
              ],
            ),
            boxShadow: glowing
                ? [
                    BoxShadow(
                      color: widget.color1.withOpacity(0.6),
                      spreadRadius: 1,
                      blurRadius: 16,
                      offset: Offset(-8, 0),
                    ),
                    BoxShadow(
                      color: widget.color2.withOpacity(0.6),
                      spreadRadius: 1,
                      blurRadius: 16,
                      offset: Offset(8, 0),
                    ),
                    BoxShadow(
                      color: widget.color1.withOpacity(0.2),
                      spreadRadius: 16,
                      blurRadius: 32,
                      offset: Offset(-8, 0),
                    ),
                    BoxShadow(
                      color: widget.color2.withOpacity(0.2),
                      spreadRadius: 16,
                      blurRadius: 32,
                      offset: Offset(8, 0),
                    )
                  ]
                : []),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 0,
            ),
            Text(
              glowing ? "Directions" : "Directions",
              style: const TextStyle(
                  color: Color.fromARGB(255, 0, 35, 131),
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

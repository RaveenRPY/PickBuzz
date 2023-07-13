import 'package:flutter/material.dart';
import 'package:pickbuzz/screens/start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 14, 163, 131)),
        useMaterial3: true,
      ),
      home: const startPage(title: 'Flutter Demo Home Page'),
    );
  }
}

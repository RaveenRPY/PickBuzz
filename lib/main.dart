import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pickbuzz/screens/bus_list.dart';
import 'package:pickbuzz/screens/start.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 14, 163, 131)),
        useMaterial3: true,
      ),
      home: const startPage(title: 'Flutter Demo Home Page'),
    );
  }
}

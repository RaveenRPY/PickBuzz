import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class Rtb extends StatefulWidget {
  const Rtb({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RtbState createState() => _RtbState();
}

class _RtbState extends State<Rtb> {
  late DatabaseReference _dbRef;
  var _lat;
  var _lon;

  @override
  void initState() {
    super.initState();
    // Initialize Firebase
    Firebase.initializeApp();

    // Get a reference to the database
    _dbRef = FirebaseDatabase.instance.ref('BUS');

    // Listen for changes in the data
    _dbRef.child('lat').onValue.listen((event) {
      setState(() {
        _lat = event.snapshot.value as double;
      });
    });

    // Listen for changes in the data
    _dbRef.child('lon').onValue.listen((event) {
      setState(() {
        _lon = event.snapshot.value as double;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Firebase Realtime DB Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Latitude: $_lat',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'Longitude: $_lon',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

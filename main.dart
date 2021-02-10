import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:here/home.dart';

import 'login.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Scaffold(
                body: Container(
                    color: Colors.white,
                    child: Text("Loading...", textAlign: TextAlign.center)));
          return Login();
        });
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
           title: Text('Dicee'),
          ),
          backgroundColor: Colors.blueAccent,
          body: SafeArea(
              child: Text('hello'),
        ),
      ),
    );
  }
}

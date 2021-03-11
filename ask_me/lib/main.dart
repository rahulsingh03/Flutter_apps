import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(
    MaterialApp(
        theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: Colors.amber.shade300),
        ),
      ),
      home:Scaffold(
        backgroundColor: Colors.amber.shade300,
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Center(
            child: Text('Ask Me Anything',
            style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 5.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: MyApp(),
      ),
    debugShowCheckedModeBanner:false,
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int swapImage = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: (){
          setState((){
            swapImage = Random().nextInt(5) + 1;
          });
        },
        child: Image.asset('images/ball$swapImage.png'),
        ),
    );
  }
}
import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(
    MaterialApp(
    //   theme: ThemeData(
    //   textButtonTheme: TextButtonThemeData(
    //   style: TextButton.styleFrom(primary: Colors.white),
    //   ),
    // ),
      home: Scaffold(
        backgroundColor: Colors.blue.shade200,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade700,
          title: Center(
            child:Text('Dicee'),
        ),
        ),
        body: MyApp(),
        ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int leftDiceNumber = 1;
  int rightDiceNumber = 2;

  void changeDiceFace(){
    setState((){
                leftDiceNumber = Random().nextInt(6) + 1;
                rightDiceNumber = Random().nextInt(6) + 1;
              });
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Center(
            child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextButton(
                          onPressed: (){
                            changeDiceFace();
                          },
                          child: Image.asset('images/dice$leftDiceNumber.png'),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextButton(
                          onPressed: (){
                            changeDiceFace();
                          },
                          child: Image.asset('images/dice$rightDiceNumber.png'),
                        ),
                      ),
                    ),
                  ],
                ),
            ),
    );
  }
}


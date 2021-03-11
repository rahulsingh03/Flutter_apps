import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XyloApp());

class XyloApp extends StatelessWidget {

  void playSound(int soundNumber){
    final AudioCache player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Widget buildKey({int i,Color color}){
    return Expanded(
                      child: TextButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(color)),
                      onPressed: (){
                      playSound(i);
                    },
                      child: Text('Click me',
                      style: TextStyle(
                        fontSize: 0,
                      ),
                    ),
                   ),
                  );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                buildKey(i:1,color:Colors.green),
                buildKey(i:2,color:Colors.redAccent),
                buildKey(i:3,color:Colors.pink),
                buildKey(i:4,color:Colors.blueAccent),
                buildKey(i:5,color:Colors.lime),
                buildKey(i:6,color:Colors.amber),
                buildKey(i:7,color:Colors.purple),
              ],
            ),
        ),
      ),
    debugShowCheckedModeBanner: false,
    );
  }
}
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int noteIndex) {
    final player = AudioCache();
    player.play('note$noteIndex.wav');
  }

  Widget flatBtn(int index, Color clr) {
    return Expanded(
      child: FlatButton(
        color: clr,
        onPressed: () {
          playSound(index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              flatBtn(1,Colors.red),
              flatBtn(2,Colors.orange),
              flatBtn(3,Colors.yellow),
              flatBtn(4,Colors.green),
              flatBtn(5,Colors.blue),
              flatBtn(6,Colors.indigo),
              flatBtn(7,Colors.purple),


            ],
          ),
        ),
      ),
    );
  }
}

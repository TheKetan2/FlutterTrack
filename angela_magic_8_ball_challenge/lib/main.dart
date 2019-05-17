import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Center(
          child: Text('Magic Balls'),
        ),
        backgroundColor: Colors.teal,
      ),
      body: MagicBall(),
    ),
  ));
}

class MagicBall extends StatefulWidget {
  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int ballIndex = 1;

  void changeBall(){
    ballIndex = Random().nextInt(5)+1;
    print("Ball number $ballIndex");
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: (){
                setState(() {
                 changeBall(); 
                });
              },
              child: Image.asset('images/ball$ballIndex.png'),

            ),
          ),
        ],
        
      ),
    );
  }
}
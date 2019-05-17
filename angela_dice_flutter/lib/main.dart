import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Center(child: Text('Dicee')),
        backgroundColor: Colors.red,
      ),
      body: DicePage(),
    ),
  ));
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int righDiceNumber = 1;

  void randomImg() {
    leftDiceNumber = new Random().nextInt(6) + 1;
    righDiceNumber = new Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              child: Image.asset('images/dice$leftDiceNumber.png'),
              onPressed: () {
                setState(() {
                  randomImg();
                });

                print('Left Button Pressed $leftDiceNumber');
              },
            ),
          ),
          Expanded(
            child: FlatButton(
                onPressed: () {
                  setState(() {
                    randomImg();
                  });

                  print('Right button got pressed.');
                },
                child: Image.asset('images/dice$righDiceNumber.png')),
          ),
        ],
      ),
    );
  }
}

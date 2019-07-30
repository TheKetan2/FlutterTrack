import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String finalScore;
  final Function resetQuiz;
  Result({this.finalScore, this.resetQuiz});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            'Final score is $finalScore',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            textColor: Colors.greenAccent,
            child: Text('Restart Quiz!'),
            onPressed: resetQuiz,
          ),
        ],
      ),
    );
  }
}

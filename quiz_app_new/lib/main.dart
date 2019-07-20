import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var questions = ['Your fav animal?', 'Your fav color?'];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Quiz App',
          ),
        ),
        body: Column(
          children: <Widget>[
            Text('The Question:'),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: null,
            ),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: null,
            ),
            RaisedButton(
              child: Text('Answer 3'),
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}

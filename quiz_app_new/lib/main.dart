import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  _ansQuestion() {
    print("Answer chosen.");
    print(_questionIndex);
    setState(() {
      _questionIndex++;
      _questionIndex %= 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What is your fav color?',
        'answerKeys': ['Black', 'Red', 'Green', 'White']
      },
      {
        'questionText': 'What is your fav Animal?',
        'answerKeys': ['Rabbit', 'Snake', 'Lion', 'Tiger']
      },
      {
        'questionText': 'What is your fav color?',
        'answerKeys': ['Black', 'Red', 'Green', 'White']
      },
      {
        'questionText': 'What is your fav color?',
        'answerKeys': ['Black', 'Red', 'Green', 'White']
      },
      {
        'questionText': 'What is your fav color?',
        'answerKeys': ['Black', 'Red', 'Green', 'White']
      },
      {
        'questionText': 'What is your fav color?',
        'answerKeys': ['Black', 'Red', 'Green', 'White']
      },
      {
        'questionText': 'What is your fav color?',
        'answerKeys': ['Black', 'Red', 'Green', 'White']
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Quiz App',
          ),
        ),
        body: Column(
          children: <Widget>[
            Question(
              queText: questions[_questionIndex]['questionText'],
            ),
            ...(questions[_questionIndex]['answerKeys'] as List<String>)
                .map((answer) {
              return Answer(
                buttonText: answer,
                onClicked: _ansQuestion,
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

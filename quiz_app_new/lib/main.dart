import 'package:flutter/material.dart';
import 'package:quiz_app_new/result.dart';
import 'quiz.dart';
import 'result.dart';

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
  var _totalScore = 0;

  _ansQuestion(int score) {
    _totalScore += score;
    print("Answer chosen.");
    print(_totalScore);
    setState(() {
      _questionIndex++;
      //_questionIndex %= 2;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _questions = [
      {
        'questionText': 'What is your fav color?',
        'answerKeys': [
          {'text': 'Black', 'score': 10},
          {'text': 'Red', 'score': 5},
          {'text': 'Green', 'score': 3},
          {'text': 'White', 'score': 1}
        ]
      },
      {
        'questionText': 'What is your fav Animal?',
        'answerKeys': [
          {'text': 'Rabbit', 'score': 14},
          {'text': 'Snake', 'score': 5},
          {'text': 'Lion', 'score': 1},
          {'text': 'Tiger', 'score': 0}
        ]
      },
      {
        'questionText': 'What is your fav color?',
        'answerKeys': [
          {'text': 'Black', 'score': 10},
          {'text': 'Red', 'score': 5},
          {'text': 'Green', 'score': 3},
          {'text': 'White', 'score': 1}
        ]
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Quiz App',
          ),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQue: _ansQuestion,
                question: _questions,
                index: _questionIndex,
              )
            : Result(
                finalScore: _totalScore.toString(),
                resetQuiz: _resetQuiz,
              ),
      ),
    );
  }
}

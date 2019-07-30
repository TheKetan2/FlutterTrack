import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List question;
  final Function answerQue;
  final int index;

  Quiz({this.answerQue, this.question, this.index});
  @override
  Widget build(BuildContext context) {
    return Column(
                children: <Widget>[
                  Question(
                    queText: question[index]['questionText'],
                  ),
                  ...(question[index]['answerKeys'] as List<String>)
                      .map((answer) {
                    return Answer(
                      buttonText: answer,
                      onClicked: answerQue,
                    );
                  }).toList(),
                ],
              );
  }
}
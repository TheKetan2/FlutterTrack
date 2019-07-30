import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String buttonText;
  final Function onClicked;

  Answer({this.buttonText, this.onClicked});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

        child: RaisedButton(
          color: Colors.blue,
          child: Text(buttonText),
          onPressed: onClicked,
        ),
    );
  }
}
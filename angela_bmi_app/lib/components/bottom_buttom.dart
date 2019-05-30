import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:BMI/constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({this.text, this.onPressed});
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: onPressed,
      child: Container(
        child: Center(
            child: Text(
          text,
          style: kLargeButtonStyle,
        )),
        color: btmColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 80.0,
      ),
    );
  }
}

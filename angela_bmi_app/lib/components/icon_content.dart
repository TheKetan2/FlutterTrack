import 'package:flutter/material.dart';
import 'package:BMI/constants.dart';
class IconContent extends StatelessWidget {
  const IconContent({this.gender, this.iconData});
  final String gender; 
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(iconData, size: 80.0),
        SizedBox(
          height: 15.0,
        ),
        Text(
          gender,
          style: labelTextStyle,
        ),
      ],
    );
  }
}

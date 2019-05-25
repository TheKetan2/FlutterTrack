import 'package:flutter/material.dart';

const labelTextStyle = TextStyle(
            fontSize: 18.0,
            color: Color(0xff8d8e98),
          );
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

import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget {
  final String title;
  final double appBarHieght = 66.0;

  GradientAppBar({this.title});
  @override
  Widget build(BuildContext context) {
    // Finding app bar height
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      height: appBarHieght + statusBarHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF3366FF),
            const Color(0xFF00CCFF),
          ],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 1.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 36.0),
        ),
      ),
    );
  }
}

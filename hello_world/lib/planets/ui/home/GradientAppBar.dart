import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget{
  
  final String title;
  final double barHeight = 66.0;
  
  GradientAppBar(this.title);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    
        return new Container(
          padding: new EdgeInsets.only(top: statusBarHeight ),
          height: barHeight+statusBarHeight,
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              colors: [
                const Color(0xff3366ff),
                const Color(0xff00ccff),
              ],
          begin:  const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp
        )

      ),
      child: new Center(
        child: new Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 36.0
          ),
        ),
      )
    );
  }

}
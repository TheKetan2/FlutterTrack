import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _color = Colors.yellow;
  var _height = 200.0;
  var _width = 200.0;
  var _borderRadius = BorderRadius.circular(100);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedContainer(
                duration: Duration(seconds: 1),
                // color: _color,
                width: _width,
                height: _height,
                decoration:
                    BoxDecoration(borderRadius: _borderRadius, color: _color),
              ),
              RaisedButton(
                child: Text("Animate!"),
                onPressed: () {
                  _color = Colors.red;
                  _height = 400;
                  _width = 400;
                  _borderRadius = BorderRadius.circular(200);
                  setState(() {});
                },
              ),
              RaisedButton(
                child: Text("Animate!"),
                onPressed: () {
                  _color = Colors.yellow;
                  _height = 200;
                  _width = 200;
                  setState(() {});
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

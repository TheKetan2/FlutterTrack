import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _showFirst = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedCrossFade(
                duration: Duration(seconds: 2),
                firstChild: FlutterLogo(
                  style: FlutterLogoStyle.horizontal,
                  size: 100.0,
                ),
                secondChild: FlutterLogo(
                  style: FlutterLogoStyle.stacked,
                  size: 100.0,
                  
                ),
                
                crossFadeState: _showFirst
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
              RaisedButton(
                child: Text("Cross-Fade!"),
                onPressed: () {
                  
                  setState(() {
                    _showFirst = !_showFirst;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

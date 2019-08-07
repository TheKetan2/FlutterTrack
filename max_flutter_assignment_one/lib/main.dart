import 'package:flutter/material.dart';
import 'textcontroll.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment App',
      home: Scaffold(
        appBar: AppBar(title: Text('First Assignment'),),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Text('This is the first assignment of Max\' course'),
                TextControl(),
              ],

              

            ),
          ),
        ),
      ),
    );
  }
}
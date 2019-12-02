import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Layout with Flutter"),),
        body: Center(
          child: Text("Hello Flutter Layouts", style: TextStyle(fontSize: 24),),
        ),
          persistentFooterButtons: <Widget>[],
      
      ),
    );
  }
}
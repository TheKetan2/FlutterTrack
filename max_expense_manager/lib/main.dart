import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 100,
            child: Card(
              elevation: 5.0,
              color: Colors.white,
              child: Text(
                'Chart',
              ),
            ),
          ),
          
          Card(
            child: Text('List of TX'),
            elevation: 5,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Tree Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: Home(title: 'Flutter Widget Tree'),
    );
  }
}


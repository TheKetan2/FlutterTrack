import 'package:flutter/material.dart';

import 'wallet.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Color(0xffe7e9f0),
        fontFamily: 'Raleway'
      ),
      home: Wallet(title: 'My Wallet'),
    );
  }
}


import 'package:flutter/material.dart';
import 'gradientappbar.dart';
import 'homepagebody.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          GradientAppBar(
            title: 'treva',
          ),
          HomePageBody(0),
          HomePageBody(1),
          HomePageBody(2),
          HomePageBody(3),
        ],
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: Center(child: Text('I am Poor'),
          ),
        
        ),
        body: Center(
          child: Image.asset('img/poor.png'),
        ),
      ),
    ));

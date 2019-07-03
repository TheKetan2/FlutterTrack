import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'products_manager.dart';
void main(){
  debugPaintBaselinesEnabled = true;
  debugPaintSizeEnabled = true;
  debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('EasyList'),
        ),
        body: 
            ProductManager(startingProduct: 'Food Tester',),
        ),
      );
  }
}
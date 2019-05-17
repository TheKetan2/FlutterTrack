import 'package:flutter/material.dart';

void main(){
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(child: Text('Dicee')),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ));
}

class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
          child: Row(
        children: <Widget>[
         Expanded(
           child: FlatButton(
             child: Image.asset('images/dice1.png'),
             onPressed: (){
               print('Left Button Pressed');
             },
             ),
          ),
         Expanded(
           child: FlatButton(
             onPressed: (){
               print('Right button got pressed.');
             },
             child: Image.asset('images/dice2.png')
           ),
         ),
        ],
      ),
    );
  }
}


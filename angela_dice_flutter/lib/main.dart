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
    return Row(
      children: <Widget>[
       Expanded(
         child:  Image(
          image: AssetImage('images/dice1.png'),
        ),
       ),
      SizedBox(width: 10.0,),

       Expanded(
         child:  Image(
          image: AssetImage('images/dice2.png'),
        ),
       ),
        
      ],
    );
  }
}


// import 'dart:ffi';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String title;
  Home({this.title});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title,),),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            
            children: <Widget>[
              new HorizontalRow(),
              Padding(padding: EdgeInsets.all(16)),
              new VerticlaWidget(),
              ],
              )
            
          

        ),
      ),
      
    );
  }

  
}

class VerticlaWidget extends StatelessWidget {
  const VerticlaWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            
            buildContainer(60, 60, Colors.blue),
            Padding(padding: EdgeInsets.all(16),),
           
            buildContainer(40, 40, Colors.amber),
            Padding(padding: EdgeInsets.all(16),),
            
            buildContainer(40, 40, Colors.brown,),
            Padding(padding: EdgeInsets.all(16),),
            
            buildContainer(20, 20, Colors.brown),
            Divider(),
            new StackWidget(),
            Divider(),
            Text("End of the Line")
          ],
        )
      ],
    );
  }
}

class StackWidget extends StatelessWidget {
  const StackWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      CircleAvatar(
        backgroundColor: Colors.lightGreen,
        radius: 100,
        child: Stack(
          children: <Widget>[
            buildContainer(100, 100, Colors.yellow),
            buildContainer(60, 60, Colors.amber),
            buildContainer(40, 40, Colors.brown),
          ],
        ),
      )
    ],);
  }
}

class HorizontalRow extends StatelessWidget {
  const HorizontalRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
    
        buildContainer(40, 40, Colors.yellow),
        Padding(
          padding: EdgeInsets.all(16),
        ),
        Expanded(
          child: buildContainer(40, 40, Colors.amber)
          
        ),
        Padding(padding: EdgeInsets.all(16),),

        buildContainer(40, 40, Colors.red),
        Padding(padding: EdgeInsets.all(16.0),),],
        );
  }
}

Container buildContainer(double h, double w, Color c) {
    return Container(
                      height: h,
                      width: w,
                      color: c,
                    );
  }

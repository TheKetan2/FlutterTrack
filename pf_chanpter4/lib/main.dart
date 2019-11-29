import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Container(height: 100,),
            Table(
              border: TableBorder(
                top: BorderSide(width: 2),
                bottom: BorderSide(width: 2),
                left: BorderSide(width: 2),
                right: BorderSide(width: 2)
              ),
              children: [
               TableRow(
                 children: [
                   Center(child: Padding(
                     padding: EdgeInsets.all(10),
                     child: Text("1"),
                   ),),
                   Center(child: Padding(
                     padding: EdgeInsets.all(10),
                     child: Text("2"),
                   ),),
                   Center(child: Padding(
                     padding: EdgeInsets.all(10),
                     child: Text("3"),
                   ),)


                 ]
               ),
               TableRow(
                 children: [
                   Center(child: Padding(
                     padding: EdgeInsets.all(10),
                     child: Text("1"),
                   ),),
                   Center(child: Padding(
                     padding: EdgeInsets.all(10),
                     child: Text("2"),
                   ),),
                   Center(child: Padding(
                     padding: EdgeInsets.all(10),
                     child: Text("3"),
                   ),)


                 ]
               ),
               
              ],
              
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.red,
              ),
              label: Text("Ketan Ramteke"),
            )
          ],
        ),
      ),
      
    );
  }
}
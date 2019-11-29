import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DragTarget(
                builder: (BuildContext context, List<String> accepted,
                    List<dynamic> rejected) {
                  return new Container(
                    width: 200,
                    height: 200,
                    color: Colors.lightBlue,
                    child: Text("hi"),
                  );
                },
                onAccept: (data)=> print(data),
              ),
              Container(height: 50,),
              Draggable(
                data: "Hi",
                child: Container(width: 100, height: 100, color: Colors.red,),
                feedback: Container(width: 100, height: 100, color: Colors.yellow,),
              )
            ],
          ),
        ),
      ),
    );
  }
}

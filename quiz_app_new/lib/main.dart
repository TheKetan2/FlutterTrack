import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }

}

class MyAppState extends State<MyApp>{
  var questionIndex = 0;
   ansQuestion(){
      print("Answer chosen.");
      print(questionIndex);
      setState(() {
       questionIndex++; 
      });
  }


  @override
  Widget build(BuildContext context) {
    var questions = ['Your fav animal?', 'Your fav color?','Your fav animal?', 'Your fav color?','Your fav animal?', 'Your fav color?'];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Quiz App',
          ),
        ),
        body: Column(
          children: <Widget>[
            Text(questions[questionIndex]),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: ansQuestion,
            ),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: () => print('Ans 2 pressed'),
            ),
            RaisedButton(
              child: Text('Answer 3'),
              onPressed: () => print('Ans 3 pressed'),
            ),
          ],
        ),
      ),
    );
  }
}

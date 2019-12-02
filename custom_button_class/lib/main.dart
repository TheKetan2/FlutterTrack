import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: CustomButton(
          onPressed: () {},
          text: "Boom",
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class CustomButton extends StatelessWidget {
  
  final Function onPressed;
  String text;
  CustomButton({@required this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children:  <Widget>[
            SizedBox(
              width: 10.0,
            ),
            Text(text),
            // Text(
            //   text,
            //   maxLines: 1,
            //   style: TextStyle(color: Colors.white, fontSize: 20.0),
            // ),
          ],
        ),
      ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}

import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ResusableCard(Color(0xff1d1eaa))),
                Expanded(
                    child: ResusableCard(Color(0xff1d1e33))),
              ],
            ),
          ),
          Expanded(
              child: ResusableCard(Color(0xff1d1e33))),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ResusableCard(Color(0xff1d1e33))),
                Expanded(
                    child: ResusableCard(Color(0xff1d1e33))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class ResusableCard extends StatelessWidget {

  ResusableCard(@required this.clr);
  Color clr;

  @override
  Widget build(BuildContext context) {
    return Container(
                  margin: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      color: clr,
                      borderRadius: BorderRadius.circular(10.0)),
                );
  }
}
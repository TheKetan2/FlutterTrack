import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const btmHeight = 80.0;
const Color coulor = Color(0xff1d1e33);
const Color btmColor = Color(0xffeb1555);

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
                    child: ResusableCard(
                        clr: coulor, cardChild: new IconContent(gender: 'Male',
                        iconData: FontAwesomeIcons.mars,))),
                Expanded(
                    child: ResusableCard(
                        clr: coulor,
                        cardChild: new IconContent(gender: 'Female',
                        iconData: FontAwesomeIcons.venus,))), 
              ],
            ),
          ),
          Expanded(
              child: ResusableCard(
            clr: coulor,
          )),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(child: ResusableCard(clr: coulor)),
                Expanded(child: ResusableCard(clr: coulor)),
              ],
            ),
          ),
          Container(
            color: btmColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: btmHeight,
          ),
        ],
      ),
    );
  }
}



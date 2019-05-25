import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                        clr: coulor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(FontAwesomeIcons.mars, size: 80.0),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'MALE',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Color(0xff8d8e98),
                              ),
                            ),
                          ],
                        ))),
                Expanded(
                    child: ResusableCard(
                        clr: coulor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(FontAwesomeIcons.venus, size: 80.0),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'MALE',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Color(0xff8d8e98),
                              ),
                            ),
                          ],
                        ))),
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

class ResusableCard extends StatelessWidget {
  ResusableCard({@required this.clr, this.cardChild});
  final Color clr;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration:
          BoxDecoration(color: clr, borderRadius: BorderRadius.circular(10.0)),
    );
  }
}

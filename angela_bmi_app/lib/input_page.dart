import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const btmHeight = 80.0;
const Color coulor = Color(0xff1d1e33);
const Color btmColor = Color(0xffeb1555);
const Color activeColor = Color(0xff1d1e33);
const Color inactiveColor = Color(0xff111328);

enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  
  Gender selectedGender;

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
                    child: GestureDetector(
                  onTap: () {
                    print("Tapped");
                    setState(() {
                      selectedGender = Gender.male;
                    });
                    
                  },
                  child: ResusableCard(
                      clr: selectedGender == Gender.male?activeColor:inactiveColor,
                      cardChild: new IconContent(
                        gender: 'Male',
                        iconData: FontAwesomeIcons.mars,
                      )),
                )),
                Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                  child: ResusableCard(
                      clr: selectedGender == Gender.female?activeColor:inactiveColor,
                      cardChild: new IconContent(
                        gender: 'Female',
                        iconData: FontAwesomeIcons.venus,
                      )),
                )),
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

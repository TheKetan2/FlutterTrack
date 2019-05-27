import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';

const btmHeight = 80.0;


enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ResusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        clr: selectedGender == Gender.male
                            ? activeColor
                            : inactiveColor,
                        cardChild: new IconContent(
                          gender: 'Male',
                          iconData: FontAwesomeIcons.mars,
                        ))),
                Expanded(
                    child: ResusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        clr: selectedGender == Gender.female
                            ? activeColor
                            : inactiveColor,
                        cardChild: new IconContent(
                          gender: 'Female',
                          iconData: FontAwesomeIcons.venus,
                        ))),
              ],
            ),
          ),
          Expanded(
              child: ResusableCard(
            clr: coulor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('HEIGHT',
                style: labelTextStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: kLabelNumberStyle,
                    ),
                    Text(
                      ' cm',
                      style: labelTextStyle,
                    ),
                  ],
                  
                ),
                Slider(
                    value: height.toDouble(),
                    min:  120.0,
                    max: 220,
                    activeColor: Color(0xffeb1555),
                    inactiveColor: Color(0xff8d8e98),
                    onChanged: (double newValue){
                        setState(() {
                         height = newValue.round(); 
                        });
                        print(newValue);
                    },
                  ),
              ],
            ),
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

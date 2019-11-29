import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  var _checkboxValue = false;
  var _switchValue = false;
  var _sliderValue = 0.3;
  var _radioValue = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(50.0),
          child: Form(
            key: this._formKey,
            child: Column(
              children: <Widget>[
                Checkbox(
                  value: _checkboxValue,
                  onChanged: (bool inValue) {
                    setState(() {
                      _checkboxValue = inValue;
                    });
                  },
                ),
                Switch(
                  activeColor: Colors.green,
                  inactiveThumbColor: Colors.red,
                  value: _switchValue,
                  onChanged: (bool inValue) {
                    setState(() {
                      _switchValue = inValue;
                    });
                  },
                ),
                Slider(
                  activeColor: Colors.green,
                  min: 0,
                  max: 20,
                  value: _sliderValue,
                  onChanged: (inValue) {
                    setState(
                      () {
                        _sliderValue = inValue;
                      },
                    );
                  },
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: (int inValue) {
                        setState(() {
                          _radioValue = inValue;
                        });
                      },
                    ),
                    Text("Option 1")
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: 2,
                      groupValue: _radioValue,
                      onChanged: (int inValue) {
                        setState(() {
                          _radioValue = inValue;
                        });
                      },
                    ),
                    Text("Option 2")
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: 3,
                      groupValue: _radioValue,
                      onChanged: (int inValue) {
                        setState(() {
                          _radioValue = inValue;
                        });
                      },
                    ),
                    Text("Option 3")
                  ],
                ),
                
                Text("Checked: ${_checkboxValue}"),
                Text("Switch: ${_switchValue}"),
                Text("Slider value: ${_sliderValue.floor()}"),
                Text("Radio Oprion: ${_radioValue}")
              ],
              
            ),
          ),
        ),
      ),
    );
  }
}

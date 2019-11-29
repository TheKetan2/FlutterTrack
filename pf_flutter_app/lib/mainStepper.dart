import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}): super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter PlayGround",
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter Playground"),),
        body: Stepper(
          type: StepperType.vertical,
          currentStep:  _currentStep,
          onStepContinue: _currentStep<2? () => setState(()=>_currentStep+=1):null,
          onStepCancel: _currentStep>0 ? ()=> setState(() => _currentStep -=1): null,
          steps: [
            Step(
              title: Text("Get Ready"), isActive: true,
              content: Text("Let's begin...")
            ),
            Step(
              title: Text("Get Set"), isActive: true,
              content: Text("Ok, just a little more...")
            ),
            Step(
              title: Text("Get Set"), isActive: true,
              content: Text("And, we are done!")
            )
          ],
        ),
      ),
    );
  }
}
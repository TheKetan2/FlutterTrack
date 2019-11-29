import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("DateTime Picker"),
        ),
        body: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  Future<void> _selectDate(context) async {
    DateTime selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2017),
        lastDate: DateTime(2021));
    print(selectedDate);
  }

  Future<void> _selectTime(context) async {
    TimeOfDay selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    print(selectedTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 50,
          ),
          RaisedButton(
            child: Text("Test DatePicker"),
            onPressed: () => _selectDate(context),
          ),
          RaisedButton(
            
            child: Text("Test TimePicker"),
            onPressed: () => _selectTime(context),
          ),
          Dismissible(
            
            key: GlobalKey(),
            onDismissed: (direction) {
              print("Goodbye!");
            },
            child: Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red
              ),
               width: double.infinity, height: 50,
              child: Text("Swipe me"),
            ),
          )
        ],
      ),
    );
  }
}

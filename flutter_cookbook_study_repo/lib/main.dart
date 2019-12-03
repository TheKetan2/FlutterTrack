import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(MyApp(
    model: CounterModel(),
  ));
}

class MyApp extends StatelessWidget {
  final CounterModel model;
  MyApp({this.model});
  @override
  Widget build(BuildContext context) {
    return ScopedModel<CounterModel>(
      model: model,
      child: MaterialApp(
        title: "Scoped MOdel Example",
        home: CounterHome("Scoped Model Example"),
      ),
    );
  }
}

class CounterModel extends Model {
  int _counter = 0;
  int get counter => _counter;

  void increament() {
    _counter++;
    notifyListeners();
  }
}

class CounterHome extends StatelessWidget {
  final String title;
  CounterHome(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("This many times you have pressed the button."),
            ScopedModelDescendant<CounterModel>(
              builder: (context, child, model) {
                return Text(
                  model._counter.toString(),
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: ScopedModelDescendant<CounterModel>(
        builder: (context, child, model) {
          return FloatingActionButton(
            onPressed: model.increament,
            tooltip: "Increament",
            child: Icon(Icons.add),
          );
        },
      ),
    );
  }
}

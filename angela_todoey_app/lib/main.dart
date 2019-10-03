import 'package:angela_todoey_app/modals/task_data.dart';
import 'package:flutter/material.dart';
import './screens/TaskScreen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (conext) => TaskData(),
      child: MaterialApp(
        home: TaskScreen(),
      ),
    );
  }
}

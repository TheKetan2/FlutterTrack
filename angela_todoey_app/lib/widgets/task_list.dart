import 'package:flutter/material.dart';
import 'task_tile.dart';
import '../modals/task.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (ctx, i) => TaskTile(
          taskTitle: tasks[i].name,
          isChecked: tasks[i].isDone,
          checkboxCallback: (bool checkboxState) {
            setState(() {
              tasks[i].toggleDone();
            });
          }),
    );
  }
}

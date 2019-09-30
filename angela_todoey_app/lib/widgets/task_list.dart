import 'package:flutter/material.dart';
import 'task_tile.dart';
import '../modals/task.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;

  const TaskList({
    this.tasks,
  });

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (ctx, i) => TaskTile(
          taskTitle: widget.tasks[i].name,
          isChecked: widget.tasks[i].isDone,
          checkboxCallback: (bool checkboxState) {
            setState(() {
              widget.tasks[i].toggleDone();
            });
          }),
    );
  }
}

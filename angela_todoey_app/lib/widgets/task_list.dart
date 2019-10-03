import 'package:angela_todoey_app/modals/task_data.dart';
import 'package:flutter/material.dart';
import 'task_tile.dart';
import '../modals/task.dart';
import 'package:provider/provider.dart';

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
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemCount: Provider.of<TaskData>(context).taskCount,
        itemBuilder: (ctx, i) => TaskTile(
            taskTitle: Provider.of<TaskData>(context).tasks[i].name,
            isChecked: Provider.of<TaskData>(context).tasks[i].isDone,
            checkboxCallback: (bool checkboxState) {
              // setState(() {
              //   Provider.of<TaskData>(context).tasks[i].toggleDone();
              // });
            }),
      );
    });
  }
}

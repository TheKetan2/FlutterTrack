import "package:flutter/material.dart";
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import "TasksDBWorker.dart";
import 'TasksModel.dart' show Task, TasksModel, tasksModel;

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<TasksModel>(
      model: tasksModel,
      child: ScopedModelDescendant<TasksModel>(
        builder: (BuildContext context, Widget inChild, TasksModel inModel) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () async {
                tasksModel.entityBeingEdited = Task();
                tasksModel.setChosenDate(null);
                tasksModel.setStackIndex(1);
              },
            ),
            body: ListView.builder(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              itemCount: tasksModel.entityList.length,
              itemBuilder: (BuildContext context, int inIndex) {
                Task task = tasksModel.entityList[inIndex];
                String sDueDate;
                if (task.dueDate != null) {
                  List dateParts = task.dueDate.split(",");
                  DateTime dueDate = DateTime(
                    int.parse(dateParts[0]),
                    int.parse(dateParts[1]),
                    int.parse(dateParts[2]),
                  );
                  sDueDate =
                      DateFormat.yMMMd("en_US").format(dueDate.toLocal());
                }

                return Slidable(
                  delegate: SlidableDrawerDelegate(),
                  actionExtentRatio: .25,
                  child: ListTile(
                    leading: Checkbox(
                      value: task.completed == "true" ? true : false,
                      onChanged: (inValue) async {
                        task.completed = inValue.toString();
                        await TasksDBWorker.db.update(task);
                        tasksModel.loadData("tasks", TasksDBWorker.db);
                      },
                    ),
                    title: Text(
                      "${task.description}",
                      style: task.completed == "true"
                          ? TextStyle(
                              color: Theme.of(context).disabledColor,
                              decoration: TextDecoration.lineThrough)
                          : TextStyle(
                              color: Theme.of(context).textTheme.title.color),
                    ),
                    onTap: () async {
                      if (task.completed == "true") {
                        return;
                      }
                      tasksModel.entityBeingEdited =
                          await TasksDBWorker.db.get(task.id);
                      if (tasksModel.entityBeingEdited.dueDate == null) {
                        tasksModel.setChosenDate(null);
                      } else {
                        tasksModel.setChosenDate(sDueDate);
                      }
                      tasksModel.setStackIndex(1);
                    },
                  ),
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      caption: "Delete",
                      color: Colors.red,
                      icon: Icons.delete,
                      onTap: () => _deleteTask(context, task),
                    )
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }

  Future _deleteTask(BuildContext context, Task task) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext inAlertContext) {
          return AlertDialog(
            title: Text("Delete Task"),
            content:
                Text("Are you sure you want to delete ${task.description}?"),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.of(inAlertContext).pop();
                },
              ),
              FlatButton(
                child: Text("Delete"),
                onPressed: () async {
                  await TasksDBWorker.db.delete(task.id);
                  Navigator.of(inAlertContext).pop();
                  Scaffold.of(inAlertContext).showSnackBar(SnackBar(
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 2),
                    content: Text("Task Deleted"),
                  ));
                  tasksModel.loadData("tasks", TasksDBWorker.db);
                },
              )
            ],
          );
        });
  }
}

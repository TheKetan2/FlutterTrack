import 'package:angela_todoey_app/modals/task_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTask;
  AddTaskScreen({this.addTask});
  final myTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void addingTaskDone() {
      Provider.of<TaskData>(context).addTask(myTextController.text);
      Navigator.of(context).pop();
    }

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              controller: myTextController,
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              color: Colors.lightBlueAccent,
              padding: const EdgeInsets.symmetric(
                horizontal: 100,
                vertical: 30,
              ),
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                myTextController.text.isEmpty
                    ? AlertDialog(
                        title: Text('Please enter the task title'),
                      )
                    : addingTaskDone();

                print(myTextController.text);
              },
            )
          ],
        ),
      ),
    );
  }
}

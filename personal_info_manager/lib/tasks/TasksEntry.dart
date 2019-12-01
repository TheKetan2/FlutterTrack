import "package:flutter/material.dart";
import "package:scoped_model/scoped_model.dart";
import '../utils.dart' as utils;
import "TasksDBWorker.dart";
import "TasksModel.dart" show TasksModel, tasksModel;

class TasksEntry extends StatelessWidget {
  final TextEditingController _descEditingController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TasksEntry() {
    _descEditingController.addListener(() {
      tasksModel.entityBeingEdited.description = _descEditingController.text;
    });
  }
  @override
  Widget build(BuildContext context) {
    _descEditingController.text = tasksModel.entityBeingEdited.description;

    return ScopedModel(
      model: tasksModel,
      child: ScopedModelDescendant<TasksModel>(
        builder: (BuildContext context, Widget inChild, TasksModel inModel) {
          return Scaffold(
            bottomNavigationBar: Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: Row(
                children: <Widget>[
                  FlatButton(
                    child: Text("Cancel"),
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                  ),
                  Spacer(),
                  FlatButton(
                    child: Text("Save"),
                    onPressed: () {
                      _save(context, tasksModel);
                    },
                  )
                ],
              ),
            ),
            body: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.description),
                    title: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      decoration: InputDecoration(hintText: "Description"),
                      controller: _descEditingController,
                      validator: (String inValue) {
                        if (inValue.length == 0) {
                          return "Please enter a description";
                        }
                        return null;
                      },
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.today),
                    title: Text("Due Date"),
                    subtitle: Text(
                      tasksModel.chosenDate == null
                          ? ""
                          : tasksModel.chosenDate,
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      color: Colors.green,
                      onPressed: () async {
                        String chosenDate = await utils.selectDate(context,
                            tasksModel, tasksModel.entityBeingEdited.dueDate);
                        if (chosenDate != null) {
                          tasksModel.entityBeingEdited.dueDate = chosenDate;
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _save(BuildContext context, TasksModel inModel) async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    if (inModel.entityBeingEdited.id == null) {
      await TasksDBWorker.db.create(tasksModel.entityBeingEdited);
    } else {
      await TasksDBWorker.db.update(tasksModel.entityBeingEdited);
    }

    tasksModel.setStackIndex(0);

    Scaffold.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
        content:  Text("Task saved"),
      )
    );
  }
}

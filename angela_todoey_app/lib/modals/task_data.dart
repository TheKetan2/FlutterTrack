import 'package:flutter/foundation.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  int get taskCount {
    return tasks.length;
  }

  void addTask(String task) {
    tasks.add(Task(name: task));
    notifyListeners();
  }

  void updateData(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(String name) {
    tasks.removeWhere((item) => item.name == name);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import '../models/task.model.dart';

class TaskProvider extends ChangeNotifier {
  // Define initial task for create list UI
  final List<Task> _tasks = [Task(title: 'Task 1'), Task(title: 'Task 2')];

  List<Task> get tasks => _tasks;

  void addTask(String newTask) {
    _tasks.add(Task(title: newTask));
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.remove(_tasks[index]);
    notifyListeners();
  }

  void toggleTaskCompletion(int index) {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
    notifyListeners();
  }
}

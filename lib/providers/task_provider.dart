import 'package:examen_parcial_2/models/task.dart';
import 'package:flutter/material.dart';


class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(String title, String description) {
    final newTask = Task(id: DateTime.now().toString(), title: title, description: description);
    _tasks.add(newTask);
    notifyListeners();
  }

  void toggleTaskCompletion(String id) {
    final taskIndex = _tasks.indexWhere((task) => task.id == id);
    _tasks[taskIndex].isCompleted = !_tasks[taskIndex].isCompleted;
    notifyListeners();
  }

  void deleteTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  void editTask(String id, String newTitle, String newDescription) {
  final taskIndex = _tasks.indexWhere((task) => task.id == id);
  if(taskIndex != -1) {
    _tasks[taskIndex].title = newTitle;
    _tasks[taskIndex].description = newDescription;
    notifyListeners();
  }
}

}
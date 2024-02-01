import 'package:examen_parcial_2/providers/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskData = Provider.of<TaskProvider>(context);
    final tasks = taskData.tasks;

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (ctx, i) => ListTile(
        title: Text(tasks[i].title),
        subtitle: Text(tasks[i].description),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            taskData.deleteTask(tasks[i].id);
          },
        ),
        leading: Checkbox(
          value: tasks[i].isCompleted,
          onChanged: (newValue) {
            taskData.toggleTaskCompletion(tasks[i].id);
          },
        ),
      ),
    );
  }
}
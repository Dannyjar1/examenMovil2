// import 'package:examen_parcial_2/providers/task_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class TaskList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final taskData = Provider.of<TaskProvider>(context);
//     final tasks = taskData.tasks;

//     return ListView.builder(
//       itemCount: tasks.length,
//       itemBuilder: (ctx, i) => ListTile(
//         title: Text(tasks[i].title),
//         subtitle: Text(tasks[i].description),
//         trailing: IconButton(
//           icon: Icon(Icons.delete),
//           onPressed: () {
//             taskData.deleteTask(tasks[i].id);
//           },
//         ),
//         leading: Checkbox(
//           value: tasks[i].isCompleted,
//           onChanged: (newValue) {
//             taskData.toggleTaskCompletion(tasks[i].id);
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:examen_parcial_2/models/task.dart';
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
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                _showEditTaskDialog(context, tasks[i]);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                taskData.deleteTask(tasks[i].id);
              },
            ),
          ],
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

void _showEditTaskDialog(BuildContext context, Task task) {
  final TextEditingController titleController =
      TextEditingController(text: task.title);
  final TextEditingController descriptionController =
      TextEditingController(text: task.description);

  showDialog(
    context: context,
    builder: (BuildContext ctx) {
      return AlertDialog(
        title: Text('Editar Tarea'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Descripción'),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Cancelar'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
          TextButton(
            child: Text('Guardar'),
            onPressed: () {
              if (titleController.text.isNotEmpty &&
                  descriptionController.text.isNotEmpty) {
                Provider.of<TaskProvider>(context, listen: false).editTask(
                    task.id, titleController.text, descriptionController.text);
                Navigator.of(ctx).pop();
              }
            },
          ),
        ],
      );
    },
  );
}

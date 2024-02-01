import 'package:examen_parcial_2/providers/task_provider.dart';
import 'package:examen_parcial_2/widgets/task_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _showAddTaskDialog() {
      final TextEditingController titleController = TextEditingController();
      final TextEditingController descriptionController = TextEditingController();

      showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('Agregar Nueva Tarea'),
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
                child: Text('Agregar'),
                onPressed: () {
                  if (titleController.text.isNotEmpty && descriptionController.text.isNotEmpty) {
                    Provider.of<TaskProvider>(context, listen: false).addTask(
                      titleController.text,
                      descriptionController.text,
                    );
                    Navigator.of(ctx).pop();
                  }
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tareas'),
      ),
      body: TaskList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskDialog(),
        tooltip: 'Agregar Tarea',
        child: Icon(Icons.add),
      ),
    );
  }
}


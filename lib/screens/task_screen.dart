
import 'package:examen_parcial_2/providers/task_provider.dart';
import 'package:examen_parcial_2/widgets/task_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Asegúrate de reemplazar esta URL por la URL directa de la imagen que desees usar.
    final String backgroundImageUrl = "https://img.freepik.com/vector-gratis/marco-fondo-azul-fluido_53876-99019.jpg?w=360&t=st=1706829898~exp=1706830498~hmac=e3cac7234d52e4ccc506a83a8831ca0cd9a557d1f117b0cd5a621e04202caea1";

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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(backgroundImageUrl),
            fit: BoxFit.cover, // Cubre todo el fondo de la pantalla
          ),
        ),
        child: TaskList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskDialog(),
        tooltip: 'Agregar Tarea',
        child: Icon(Icons.add),
      ),
    );
  }
}

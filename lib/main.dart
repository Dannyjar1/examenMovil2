import 'package:examen_parcial_2/providers/task_provider.dart';
import 'package:examen_parcial_2/screens/task_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => TaskProvider(),
      child: MaterialApp(
        title: 'Lista de Tareas',
        home: TaskScreen(),
      ),
    );
  }
}

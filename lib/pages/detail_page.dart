import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class DetailPage extends StatelessWidget {
  final Todo todo;
  const DetailPage({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(todo.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(todo.title),
            Text(todo.description),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.pop(context);
        },
        label: const Text("Back"),
        icon: const Icon(Icons.arrow_back),
        tooltip: 'Back',
      ),
    );
  }
}

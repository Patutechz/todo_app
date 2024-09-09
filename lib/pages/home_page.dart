import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/pages/detail_page.dart';
import 'package:todo_app/util/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  List<Todo> todos = [
    Todo(
        title: "Build a Todo App using Flutter",
        description:
            "Build a Todo App using Flutter and firebase as a backend service",
        completed: true),
    Todo(
        title: "Build a Dashboard using Flutter",
        description:
            "Build a Mobile app dashboard using Flutter and firebase as a backend service",
        completed: false),
  ];

  void removeTodo(Todo todo){
    setState(() {
      todos.remove(todo);
    });
  }

  void toggleTodo(Todo todo){
      print(todo);
    setState(() {
      todo.completed = !todo.completed;
    });
  }

  void openBox() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Add Todo",
          style: TextStyle(fontSize: 16),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "Enter Todo Title",
                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                ),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade500)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade900)),
              ),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                hintText: "Enter Todo Description",
                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                ),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade500)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade900)),
              ),
            ),
          ],
        ),
        actions: [
          MaterialButton(
            color: Colors.deepPurple,
            onPressed: () {
              setState(() {
                todos.add(
                  Todo(
                    title: titleController.text,
                    description: descriptionController.text,
                    completed: false,
                  ),
                );
              });
              titleController.clear();
              descriptionController.clear();
              Navigator.pop(context);
            },
            child: Text(
              "Save",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: zinic900,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Todo App",
          style: TextStyle(
              // fontSize: 16,
              // letterSpacing: 4,
              ),
        ),
      ),
      body: todos.isNotEmpty ? ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return ListTile(
            title: Text(
              todos[index].title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                  decoration: todo.completed
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
            // subtitle: Text(todos[index].description),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => toggleTodo(todo),
                  icon: Icon(
                    Icons.favorite,
                    color: todo.completed ? Colors.deepPurple : Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(todo: todo),
                      ),
                    );
                  },
                  icon: Icon(Icons.settings),
                ),
                IconButton(
                  onPressed: () => removeTodo(todo),
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          );
        },
      ) : Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("No Todo"),
          SizedBox(height: 8,),
          MaterialButton(
            color: Colors.deepPurple,
            onPressed: openBox, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Add Todo"),
            ),),
        ],
      ),),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        onPressed: openBox,
        label: const Text("Add Todo"),
        icon: const Icon(Icons.add),
        tooltip: 'Add Todo',
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mytodoapp/todo/data/db/database_local.dart';
import 'package:mytodoapp/todo/domain/entities/todo.dart';

class AddTodoScreen extends StatefulWidget {
  final DatabaseLocal databaseLocal;

  AddTodoScreen({
    required this.databaseLocal,
    Key? key,
  }) : super(key: key);

  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  late TextEditingController _textController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(labelText: 'Todo Text'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Todo Description'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _addTodo(),
              child: Text('Add Todo'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _addTodo() async {
    final text = _textController.text.trim();
    final description = _descriptionController.text.trim();

    if (text.isNotEmpty) {
      final newTodo = Todo(
        DateTime.now().toString(), // You might want to generate a unique ID here
        text,
        description,
      );

      await widget.databaseLocal.add(newTodo);

      // Return the new todo to the calling screen
      Navigator.pop(context, newTodo);
    }
  }
}

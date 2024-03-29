import 'package:flutter/material.dart';
import 'package:mytodoapp/todo/data/db/database_local.dart';
import 'package:mytodoapp/todo/domain/entities/todo.dart';

class AddTodoScreen extends StatefulWidget {
  final DatabaseLocal databaseLocal;

  const AddTodoScreen({
    required this.databaseLocal,
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
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
        title: const Text('Add Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(labelText: 'Todo Text'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Todo Description'),
            ),
            const SizedBox(height: 16),
            // Remove ElevatedButton from here
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTodo(),
        child: const Icon(Icons.add),
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
      // ignore: use_build_context_synchronously
      Navigator.pop(context, newTodo);
    }
  }
}

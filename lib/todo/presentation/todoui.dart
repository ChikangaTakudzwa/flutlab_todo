import 'package:flutter/material.dart';
import 'package:mytodoapp/todo/domain/entities/todo.dart';
import 'package:mytodoapp/todo/data/repos/todo_repo_data.dart'; // Import TodoRepoData
import 'package:mytodoapp/todo/domain/repos/todo_repo.dart';
import 'package:mytodoapp/todo/data/db/database_local.dart'; // Import DatabaseLocalImpl
import 'package:mytodoapp/todo/presentation/nav_service.dart'; // Import DatabaseLocalImpl

class TodoApp extends StatefulWidget {

  final NavigatorService navigatorService;
  final DatabaseLocal databaseLocal; // Add this line
  
  const TodoApp({Key? key, required this.navigatorService, required this.databaseLocal}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {

  final DatabaseLocal _databaseLocal = DatabaseLocalImpl();
  late TextEditingController _textController;
  late TextEditingController _descriptionController;
  
  final List<Todo> _todos = [];

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _descriptionController = TextEditingController();
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    final text = _textController.text.trim();
    final description = _descriptionController.text.trim();

    if (text.isNotEmpty) {
      final newTodo = Todo(
        DateTime.now().toString(), // You might want to generate a unique ID here
        text,
        description,
      );

      await widget.databaseLocal.add(newTodo);

      // Fetch the updated list of todos and update the UI
      await _loadTodos();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Todo App'),
        ),
        body: _buildTodoList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _navigateToAddTodoScreen(),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildTodoList() {
    return ListView.builder(
      itemCount: _todos.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_todos[index].text),
          subtitle: Text(_todos[index].description),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _deleteTodo(_todos[index]),
          ),
        );
      },
    );
  }

  Future<void> _deleteTodo(Todo todo) async {
    await _databaseLocal.delete(todo);
    _loadTodos();
  }

  void _navigateToAddTodoScreen() async {
    final result = await widget.navigatorService.navigateTo('/addTodo');
    if (result != null && result is Todo) {
      // If a new todo is added, refresh the list
      _loadTodos();
    }
  }
}
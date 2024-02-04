import 'package:flutter/material.dart';
import 'todo/presentation/todoui.dart';
import 'todo/presentation/nav_service.dart';
import 'todo/presentation/add_todo_screen.dart';
import 'package:mytodoapp/todo/data/db/database_local.dart'; 


void main() {
  final NavigatorService navigatorService = NavigatorService();
  final DatabaseLocal databaseLocal = DatabaseLocalImpl();
  runApp(MyApp(navigatorService: navigatorService));
}

class MyApp extends StatelessWidget {
  final NavigatorService navigatorService;

  
  const MyApp({required this.navigatorService, Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorService.navigatorKey,
      title: 'My Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TodoApp(navigatorService: navigatorService, databaseLocal: DatabaseLocalImpl()),
        '/addTodo': (context) => AddTodoScreen(databaseLocal: DatabaseLocalImpl()),
      },
    );
  }
}



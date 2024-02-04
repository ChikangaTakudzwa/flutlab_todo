import 'package:mytodoapp/todo/domain/entities/todo.dart';

abstract class TodoRepo {
  //add todo
  Future<Todo> add(Todo todo);

  //delete todo
  Future<Todo> delete(Todo todo);

  //edit todo
  Future<Todo> edit(Todo todo);

  //get all todo's
  Future<List<Todo>> getAll();
}

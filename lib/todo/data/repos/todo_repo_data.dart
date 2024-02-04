import 'package:mytodoapp/todo/domain/entities/todo.dart';
import 'package:mytodoapp/todo/domain/repos/todo_repo.dart';

class TodoRepoData implements TodoRepo {
  @override
  Future<Todo> add(Todo todo) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<Todo> delete(Todo todo) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Todo> edit(Todo todo) {
    // TODO: implement edit
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }
}

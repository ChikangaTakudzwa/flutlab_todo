import 'package:mytodoapp/todo/domain/entities/todo.dart';
import 'package:mytodoapp/todo/domain/repos/todo_repo.dart';

class TodoRepoData implements TodoRepo {
  @override
  Future<Todo> add(Todo todo) async {
    // TODO: implement add

    throw UnimplementedError();
  }

  @override
  Future<Todo> delete(Todo todo) async {
    // TODO: implement delete

    throw UnimplementedError();
  }

  @override
  Future<Todo> edit(Todo todo) async {
    // TODO: implement edit

    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> getAll() async {
    // TODO: implement getAll

    throw UnimplementedError();
  }
}

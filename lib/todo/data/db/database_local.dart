import 'package:mytodoapp/todo/data/repos/todo_repo_data.dart';
import 'package:mytodoapp/todo/domain/entities/todo.dart';

abstract class DatabaseLocal{
  //add todo
  Future<Todo> add(Todo todo);

  //delete todo
  Future<Todo> delete(Todo todo);

  //edit todo
  Future<Todo> edit(Todo todo);

  //get all todo's
  Future<List<Todo>> getAll();
}

class DatabaseLocalImpl implements DatabaseLocal{
  final TodoRepoData _todoRepo = TodoRepoData(); // Instantiate TodoRepoData

  @override
  Future<Todo> add(Todo todo) async {
    return await _todoRepo.add(todo);
  }

  @override
  Future<Todo> delete(Todo todo) async {
    return await _todoRepo.delete(todo);
  }

  @override
  Future<Todo> edit(Todo todo) async {
    return await _todoRepo.edit(todo);
  }

  @override
  Future<List<Todo>> getAll() async {
    return await _todoRepo.getAll();
  }

}
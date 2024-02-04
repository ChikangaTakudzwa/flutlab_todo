import 'package:mytodoapp/todo/domain/entities/todo.dart';
import 'package:mytodoapp/todo/domain/repos/todo_repo.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TodoRepoData{
  
  // TodoRepoData() {
  //   _initDatabase();
  // }
  // late Database _database;

  // Future<void> _initDatabase() async {
  //   // Get a location using getDatabasesPath
  //   var databasesPath = await getDatabasesPath();
  //   String path = join(databasesPath, 'todo_database.db');

  //   // open the database
  //   _database = await openDatabase(path, version: 1,
  //       onCreate: (Database db, int version) async {
  //     // create the table
  //     await db.execute('''
  //       CREATE TABLE todos (
  //         id TEXT PRIMARY KEY,
  //         text TEXT,
  //         description TEXT
  //       )
  //     ''');
  //   });
  // }
  final String baseUrl = 'https://x8ki-letl-twmt.n7.xano.io/api:KUQJOK19';
  final String apiKey = 'eyJhbGciOiJSUzI1NiJ9.eyJ4YW5vIjp7ImRibyI6Im1hc3Rlcjp1c2VyIiwiaWQiOjYyOTY0LCJhY2Nlc3NfdG9rZW4iOnsia2V5aWQiOiJkNzQ5YzBhYS0zZmY3LTQ0MDMtOGUzMS1mY2YyMDg5ZTM5YjciLCJzY29wZSI6eyJ3b3Jrc3BhY2U6YWRkb24iOjE1LCJ3b3Jrc3BhY2U6YXBpIjoxNSwid29ya3NwYWNlOmNvbnRlbnQiOjE1LCJ3b3Jrc3BhY2U6ZGF0YWJhc2UiOjE1LCJ3b3Jrc3BhY2U6ZGF0YXNvdXJjZTpsaXZlIjoxNSwid29ya3NwYWNlOmZpbGUiOjE1LCJ3b3Jrc3BhY2U6ZnVuY3Rpb24iOjE1LCJ3b3Jrc3BhY2U6cmVxdWVzdGhpc3RvcnkiOjE1LCJ3b3Jrc3BhY2U6dGFzayI6MTV9fX0sImlhdCI6MTcwNzA2NDUxNSwibmJmIjoxNzA3MDY0NTE1LCJhdWQiOiJ4YW5vOm1ldGEifQ.tidHHgAy_dpaOwPUpsS6BuYK32GXognm6L6AjEPjH5rfddOTpz_JD4N1HoTxg1zIMwsWr5naS44ll5nuh_H_RhE5fbS6ia73p0opL0WhSsxno0TfW-g93zwtesouK9ya1-aLidtg_NJLbMJk3NOyz9yxjJMKrGj4_hS6rqzGRPSVZ3FAlnpc08BzZKXGnYcuhbX1Wppa5TUtDVDxvGSqbPJZLwSx8EYxmsy_vIsueALoQsjFB9ko5bymt1dmIw4E5zhfqWskWxUgJ3TmbnbKamoIgm_K6XpcT_Z-ZkdupoU_zr241Ck_mgbi8LYxYuhpiml4BDdqw68CVM9qn99i2iz185wtqi3-tbAg_CvRF-jNO3aoWVO2LwdA7evj-djS7bKXgQTsW9may18w7-yFq4LnE94P2R1p_gk2UOza0DBjbjyKRAQI1EQ4faxgN4Ghczv25bdnFv_tMWK09U0Nr_FXlm1o0KkPrrjCOjVF_HoUVPlFuW9Daa3qfKP5qSRV6B0SF90bXIRbxWulv1Gm8wi-5pv-Do8UPisur3DN9hcjB0VDMCwYoLhaPH14i3_Q8jxHf6eSltNMKKyeEmfSpcOaf_UPOyon_BX61sr5lYkgRSh_tZlKwhaPK_oXdPSEi5JxkdhdGt6qHxA4IBeskZ6o79zL0LgSRwlvxDCApU8';

  Future<Todo> add(Todo todo) async {
    final response = await http.post(
      Uri.parse('$baseUrl/todo'),
      headers: {
        'Content-Type': 'application/json',
        'xano-key': apiKey,
      },
      body: jsonEncode(todo.toMap()),
    );

    if (response.statusCode == 200) {
      return Todo.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to add todo');
    }
  }

  Future<Todo> delete(Todo todo) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/todo/${todo.id}'),
      headers: {
        'Content-Type': 'application/json',
        'xano-key': apiKey,
      },
    );

    if (response.statusCode == 200) {
      return Todo.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete todo');
    }
  }

  Future<Todo> edit(Todo todo) async {
    final response = await http.put(
      Uri.parse('$baseUrl/todo/${todo.id}'),
      headers: {
        'Content-Type': 'application/json',
        'xano-key': apiKey,
      },
      body: jsonEncode(todo.toMap()),
    );

    if (response.statusCode == 200) {
      return Todo.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to edit todo');
    }
  }

  Future<List<Todo>> getAll() async {
    final response = await http.get(
      Uri.parse('$baseUrl/todo'),
      headers: {
        'Content-Type': 'application/json',
        'xano-key': apiKey,
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> todosJson = jsonDecode(response.body);
      return todosJson.map((json) => Todo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to get todos');
    }
  }
}

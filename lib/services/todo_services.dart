import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_practice_app/models/todo_model.dart';

class TodoServices {
  final baseUrl = 'https://jsonplaceholder.typicode.com/todos';
  final client = http.Client();

  // get
  Future<List<Todo>> fetchTodoList() async {
    final responce = await client.get(Uri.parse(baseUrl));

    if (responce.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(responce.body);
      List<Todo> todoData = jsonData.map((e) => Todo.fromJson(e)).toList();
      return todoData;
    }
    

    return [];
  }
}

import 'package:flutter/material.dart';
import 'package:http_practice_app/models/todo_model.dart';
import 'package:http_practice_app/services/todo_services.dart';

class TodoProvider extends ChangeNotifier {
  final baseClientservice = TodoServices();
  List<Todo> _todoList = [];

  List<Todo> getTodoList() => _todoList;


  //  http call
  Future<void>  get fetchTodoList async {
    _todoList = await baseClientservice.fetchTodoList();
    notifyListeners();
  }



}

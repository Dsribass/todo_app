import 'package:todo_app/app/views/add_todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/app/views/todo_list.dart';

class TodoApp extends StatelessWidget {
  final String appName = "Todo List";
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.light
      ),
      routes: {
        '/': (context) => TodoList(),
        '/add': (context) => AddTodo(),
      },
    );
  }
}
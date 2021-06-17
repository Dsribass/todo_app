import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/app/components/header.dart';
import 'package:todo_app/app/components/list_view_todos.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key,}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, "/add"),
          child: Icon(Icons.add),
        ),
        body: Container(
            padding: EdgeInsets.only(top: 80),
            child: Column(
              children: [
                Header(title:"Tarefas Diárias"),
                ListViewTodos(),
              ],
            )));
  }
}

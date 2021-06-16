import 'package:todo_app/app/components/create_form_task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40,vertical: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              iconSize: 50,
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 60),
            Text(
              "Adicionar Nova Tarefa",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
            CreateFormTask(),
          ],
        ),
      ),
    ));
  }
}

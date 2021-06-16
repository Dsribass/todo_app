import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreateFormTask extends StatefulWidget {
  @override
  CreateFormTaskState createState() {
    return CreateFormTaskState();
  }
}

class CreateFormTaskState extends State<CreateFormTask> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController taskName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: taskName,
            style: TextStyle(fontSize: 16),
            decoration: InputDecoration(
                labelText: "Nome",
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                labelStyle: TextStyle(fontSize: 16.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'É necessario digitar algo';
              }
              return null;
            },
            
          ),
          Container(
            margin: EdgeInsets.only(top:20),
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () async{
                if (_formKey.currentState!.validate()) {
                  await FirebaseFirestore.instance.collection('todo').add({
                    "task_name": taskName.text,
                    "is_checked": false
                  });

                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Tarefa Cadastrada')));
                  Navigator.pop(context);
                }
              },
              child: Text('Adicionar',style: TextStyle(fontSize: 18),),
            ),
          ),
        ],
      ),
    );
  }
}

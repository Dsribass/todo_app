import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListViewTodos extends StatefulWidget {
  const ListViewTodos({Key? key}) : super(key: key);

  @override
  _ListViewTodosState createState() => _ListViewTodosState();
}

class _ListViewTodosState extends State<ListViewTodos> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('todo').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("Erro: ${snapshot.error}"));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 15),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var task = snapshot.data!.docs[index];
              return Card(
                  child: ListTile(
                title: Text(task['task_name']),
                leading: IconButton(
                  icon: Icon(
                    Icons.remove_circle
                  ),
                  color: Colors.red,
                  onPressed: () => task.reference.delete(),
                ),
                trailing: Checkbox(
                  value: task['is_checked'],
                  onChanged: (value) async {
                    await task.reference.update({"is_checked": value!});
                  },
                ),
              ));
            },
          ),
        );
      },
    );
  }
}

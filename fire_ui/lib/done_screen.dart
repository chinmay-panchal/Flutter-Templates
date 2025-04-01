import 'package:fire_ui/container_class.dart';
import 'package:fire_ui/dashboard.dart';
import 'package:flutter/material.dart';

// import 'package:fire_ui/dashboard.dart';

// class DoneScreen extends StatelessWidget {
//   const DoneScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: done.length,
//         itemBuilder: (context, index) => ContainerClass(
//           index,
//           done,
//           t: done[index].title,
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_ui/models/Priority.dart';
import 'package:fire_ui/models/todo_item.dart';

// class DoneScreen extends StatelessWidget {
//   const DoneScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     CollectionReference todosCollection =
//         FirebaseFirestore.instance.collection('todos');

//     return Scaffold(
//       appBar: AppBar(title: Text("Done Tasks")),
//       body: StreamBuilder(
//         stream: todosCollection
//             .where('priority',
//                 isEqualTo: Priority.Done.toString())
//             .snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (!snapshot.hasData) {
//             return Center(child: CircularProgressIndicator());
//           }

//           var doneTasks = snapshot.data!.docs.map((doc) {
//             return TodoItem(
//               title: doc['title'],
//               Description: doc['description'],
//               priority: Priority.Done,
//             );
//           }).toList();

//           return ListView.builder(
//             itemCount: doneTasks.length,
//             itemBuilder: (context, index) {
//               return ContainerClass(index, doneTasks,
//                   t: doneTasks[index].title);
//             },
//           );
//         },
//       ),
//     );
//   }
// }

class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference todosCollection = FirebaseFirestore.instance
        .collection('todos')
        .doc(uid)
        .collection('Todo items');

    return Scaffold(
      appBar: AppBar(title: Text("Done Tasks")),
      body: StreamBuilder(
        stream: todosCollection
            .where('priority', isEqualTo: Priority.Done.toString())
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          var doneTasks = snapshot.data!.docs.map((doc) {
            return TodoItem(
              title: doc['title'],
              Description: doc['description'],
              priority: Priority.Done,
            );
          }).toList();

          return ListView.builder(
            itemCount: doneTasks.length,
            itemBuilder: (context, index) {
              return ContainerClass(index, doneTasks,
                  t: doneTasks[index].title);
            },
          );
        },
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_fire/Utility/enum.dart';
import 'package:new_fire/Models/taskitem.dart';
import 'package:new_fire/others/taskprovider.dart';
import 'package:new_fire/others/totalcount.dart';
import 'package:provider/provider.dart';

class Anonymous extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference todosCollection =
      FirebaseFirestore.instance.collection('todos');

  void onSave(Priority? priority) async {
    try {
      await todosCollection.add({
        'title': "New Task",
        'priority': priority?.title.toString() ?? 'no title',
      });
      print("Firestore write successful!");
    } catch (e) {
      print("Error writing to Firestore: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    print("rebuild");
    User? user = FirebaseAuth.instance.currentUser;
    final taskprovider = Provider.of<Taskprovider>(context, listen: false);
    final totalcount = Totalcount();
    final title = Provider.of<String>(context, listen: false);
    final futureprovider = Provider.of<int>(context);

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: totalcount.total,
              builder: (context, value, child) => Text(
                  'New Count = ${value.toString()} & Old Count = ${futureprovider.toString()}'),
            ),
            Consumer<Taskprovider>(
              builder: (ctx, value, child) => Expanded(
                child: ListView.builder(
                    itemCount: value.dummy.length,
                    itemBuilder: (ctx, index) {
                      return Container(
                          margin: EdgeInsets.all(10),
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: value.dummy[index].priority.color
                                .withOpacity(0.5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  value.dummy[index].name,
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: value.dummy[index].priority.color,
                                ),
                                child: Text(
                                  value.dummy[index].priority.name,
                                  // context
                                  //     .watch<value>()
                                  //     .dummy[index]
                                  //     .priority
                                  //     .name,
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                            ],
                          ));
                    }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          taskprovider.additem(Taskitem("new task", Priority.Medium));
          totalcount.inc();
          onSave(Priority.Medium);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// child: Text(
//           "Anonymous User ID: ${user?.uid ?? "Not logged in"}",
//           style: TextStyle(fontSize: 18),
//           textAlign: TextAlign.center,
//         ),
import 'package:fire_ui/container_class.dart';
import 'package:fire_ui/dialog_box.dart';
import 'package:fire_ui/done_screen.dart';
import 'package:fire_ui/homescreen.dart';
import 'package:fire_ui/main.dart';
import 'package:fire_ui/models/Priority.dart';
import 'package:fire_ui/models/todo_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<TodoItem> items = [
  TodoItem(
      title: "complete to do app",
      Description: "use firebase in this project",
      priority: Priority.Urgent),
  TodoItem(
      title: "complete Reddit clone",
      Description: "Community based social media app",
      priority: Priority.Medium),
  TodoItem(
      title: "complete flutter roadmap",
      Description: "Use google sheet for reference",
      priority: Priority.High),
];

List<TodoItem> done = [];
 String? uid;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
 
  late CollectionReference todosCollection; 

  @override
  void initState() {
    super.initState();
    getUserUID().then((value) {
      setState(() {
        uid = value ?? '';
        todosCollection = FirebaseFirestore.instance
            .collection('todos')
            .doc(uid)
            .collection('Todo items'); 
      });
    });
  }

  Priority? selectedPriority;
  TextEditingController _titlecontroller = TextEditingController();
  TextEditingController _subcontroller = TextEditingController();

  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // void onSave(Priority? priority) {
  //   print(priority);
  //   items.add(TodoItem(
  //       title: _titlecontroller.text,
  //       Description: _subcontroller.text,
  //       priority: priority ?? Priority.Low));
  //   _titlecontroller.clear();
  //   _subcontroller.clear();
  //   Navigator.pop(context);
  //   setState(() {});
  // }

  void onSave(Priority? priority) async {
    await todosCollection.add({
      'title': _titlecontroller.text,
      'description': _subcontroller.text,
      'priority': priority?.toString() ?? Priority.Low.toString(),
    });

    _titlecontroller.clear();
    _subcontroller.clear();
    if (context.mounted) {
      Navigator.pop(context);
    }
  }

  // void onUpdate(int index, Priority priority) {
  //   items[index].title = _titlecontroller.text;
  //   items[index].Description = _subcontroller.text;
  //   items[index].priority = priority!;
  //   if (priority == Priority.Done) {
  //     onDone(index);
  //   }
  //   setState(() {});
  // }

  void onUpdate(String docId, Priority priority) async {
    await todosCollection.doc(docId)
      ..update({
        'title': _titlecontroller.text,
        'description': _subcontroller.text,
        'priority': priority.toString(),
      });

    // if (priority == Priority.Done) {
    //   onDone(docId);
    // }
  }

  // void onDelete(int index) {
  //   items.removeAt(index);
  //   setState(() {});
  // }

  void onDelete(String docId) async {
    await todosCollection.doc(docId).delete();
  }

  void onDone(String docId) async {
    // if you want to make a new collection then only
    // DocumentSnapshot doc = await todosCollection.doc(docId).get();

    // if (doc.exists) {
    //   await FirebaseFirestore.instance.collection('done_tasks').doc(docId).set(
    //         doc.data() as Map<String, dynamic>,
    //       );
    //   await todosCollection.doc(docId).delete();
    // }
  }

  // void onDone(int index) {
  //   print("onDone called");
  //   done.add(items[index]);
  //   items.removeAt(index);
  //   print(done.length);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(height: 200,),
            ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text('Done Tasks'),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => DoneScreen()));
                }),
            Divider(), // Just for UI separation
            ListTile(
              title: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text('Logout', style: TextStyle(color: Colors.red)),
              ),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                // await prefs.setBool('isLoggedIn', false);
                await prefs.remove('uId'); // Remove UID instead of boolean
                FirebaseAuth.instance.signOut();

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Homescreen()),
                  (route) => false, // Remove all previous routes
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        // leading: InkWell(

        //   child: Icon(Icons.menu)),
        title: const Text("Today's Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: todosCollection
              .where('priority', isNotEqualTo: Priority.Done.toString())
              .snapshots(), // Real-time updates
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                  child:
                      CircularProgressIndicator()); // Show loader while fetching
            }

            List<TodoItem> items = snapshot.data!.docs.map((doc) {
              return TodoItem(
                title: doc['title'],
                Description: doc['description'],
                priority: Priority.values.firstWhere(
                  (e) => e.toString() == doc['priority'],
                  orElse: () => Priority.Low,
                ),
              );
            }).toList();

            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                var doc = snapshot.data!.docs[index]; // Firestore document
                String docId = doc.id; // Firestore document ID

                return InkWell(
                  onTap: () {
                    _titlecontroller.text = items[index].title;
                    _subcontroller.text = items[index].Description;
                    selectedPriority = items[index].priority;

                    showDialog(
                      context: context,
                      builder: (ctx) => DialogBox(
                        titleController: _titlecontroller,
                        disController: _subcontroller,
                        selectedPriority: selectedPriority,
                        onUpdate: (value) {
                          onUpdate(docId, value);
                        },
                        onDelete: () {
                          onDelete(docId);
                        },
                        onDone: () {
                          onDone(docId);
                        },
                      ),
                    );
                  },
                  child: ContainerClass(index, items, t: items[index].title),
                );
              },
            );
          },
        ),
      ),
      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: ListView.builder(
      //     itemCount: items.length,
      //     itemBuilder: (context, index) => InkWell(
      //       onTap: () {
      //         _titlecontroller.text = items[index].title;
      //         _subcontroller.text = items[index].Description;
      //         selectedPriority = items[index].priority;
      //         showDialog(
      //           context: context,
      //           builder: (ctx) => DialogBox(
      //             titleController: _titlecontroller,
      //             disController: _subcontroller,
      //             selectedPriority: selectedPriority,
      //             onUpdate: (value) {
      //               onUpdate(index, value);
      //             },
      //             onDelete: () {
      //               onDelete(index);
      //             },
      // onDone: () {
      //   onDone(index);
      // },
      //           ),
      //         );
      //       },
      //       child: ContainerClass(
      //         index,
      //         items,
      //         t: items[index].title,
      //       ),
      //     ),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) {
                  return DialogBox(
                    titleController: _titlecontroller,
                    disController: _subcontroller,
                    selectedPriority: selectedPriority,
                    onSave: onSave,
                  );
                });
          },
          child: Icon(Icons.add)),
    );
  }
}

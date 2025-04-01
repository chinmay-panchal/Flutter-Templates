import 'dart:async';

import 'package:color_todo/list_widget.dart';
import 'package:color_todo/status.dart';
import 'package:color_todo/todo_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

List<TodoItem> items = [
  TodoItem(
      title: 'complete flutter roadmap',
      subtitle: 'follow google sheet',
      status: Status.High),
  TodoItem(
      title: 'complete reddit clone app',
      subtitle: 'College project yet to be done',
      status: Status.Medium),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formGlobalKey = GlobalKey<FormState>();
  Status _selectedStatus = Status.Low;
  // String _description = "";
  // String _title = "";
  TextEditingController _titlecontroller = TextEditingController();
  TextEditingController _descontroller = TextEditingController();

  List a = List.generate(10, (index) => "hello");

  final _todoController = StreamController<List<TodoItem>>.broadcast();

  Stream<List<TodoItem>> get todoStream => _todoController.stream;

  void getData() async {
    await Future.delayed(Duration(microseconds: 2500));
    _todoController.add(List.from(items));
  }

  // Stream<List<TodoItem>> getData() async* {
  //   await Future.delayed(Duration(seconds: 5));
  //   yield items;
  // }

  // Future getData() async {
  //   return Future.delayed(const Duration(seconds: 4), () {
  //     return items;
  //   });
  // }

  void addTodo(TodoItem todo) {
    items.add(todo);
    _todoController.sink.add(List.from(items));
  }

  @override
  void initState() {
    print(a);
    getData();
    // TODO: implement initState
    // getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Color Stamps'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            StreamBuilder(
                stream: todoStream,
                // initialData: getData(),
                // stream: getData(),
                builder: (context, snapshot) {
                  print(snapshot.hasData);
                  // print(snapshot.data?.map((e) => e.title));
                  if (snapshot.hasData) {
                    return Expanded(
                        child: ListWidget(
                      item: snapshot.data ?? [],
                    ));
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
            // FutureBuilder(
            //     // stream: todoStream,
            //     future: getData(),
            //     initialData: "Loading",
            //     builder: (context, snapshot) {
            //       print(snapshot.hasData);
            //       // print(snapshot.data?.map((e) => e.title));
            //       if (snapshot.hasData &&
            //           snapshot.data.runtimeType == List<TodoItem>) {
            //         return Expanded(
            //             child: ListWidget(
            //           item: snapshot.data ?? [],
            //         ));
            //       } else {
            //         return Column(
            //           children: [
            //             const CircularProgressIndicator(),
            //             Text(snapshot.data)
            //           ],
            //         );
            //       }
            //     }),
            Form(
                key: _formGlobalKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _titlecontroller,
                      maxLength: 20,
                      decoration: const InputDecoration(
                        label: Text('Enter Title'),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'You must enter a title ';
                        }
                        return null;
                      },
                      // onSaved: (value) {
                      //   _title = value!;
                      // }
                    ),
                    TextFormField(
                      controller: _descontroller,
                      maxLength: 40,
                      decoration: const InputDecoration(
                        label: Text('Enter Description'),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 5) {
                          return 'Entry must be more than 5 length';
                        }
                        return null;
                      },
                      // onSaved: (value) {
                      //   _description = value!;
                      // },
                    ),
                    DropdownButtonFormField(
                        value: _selectedStatus,
                        decoration: const InputDecoration(
                            label: Text('Urgency of the task')),
                        items: Status.values.map((p) {
                          return DropdownMenuItem(
                              value: p, child: Text(p.title));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedStatus = value!;
                          });
                        }),
                    FilledButton(
                      onPressed: () {
                        if (_formGlobalKey.currentState!.validate()) {
                          //validator returning null everywhere means true, i.e, all fields are not empty and valid
                          // _formGlobalKey.currentState!.save();

                          // items.add(TodoItem(
                          //     title: _title,
                          //     subtitle: _description,
                          //     status: _selectedStatus));
                          // setState(() {});
                          addTodo(TodoItem(
                              title: _titlecontroller.text,
                              subtitle: _descontroller.text,
                              status: _selectedStatus));

                          // _formGlobalKey.currentState!.reset();
                          // _selectedStatus = Status.Low;
                        }
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.grey[800],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Text('Add'),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

  // TextField(
  //   obscureText: true,            //   keyboardType: TextInputType.emailAddress,
  //   decoration: InputDecoration(
  //       label: Text('Email Address'),
  //       hintText: 'Example: abc@gmail.com'),
  //   onChanged: (value) {
  //     setState(() {
  //       _email = value;
  //     });
  //   },
  // ), 

import 'package:flutter/material.dart';
import 'package:new_fire/Utility/enum.dart';
import 'package:new_fire/Models/taskitem.dart';

class Taskprovider with ChangeNotifier {
  List<Taskitem> _dummy = [
    Taskitem("task1", Priority.Low),
    Taskitem("task2", Priority.Low),
    Taskitem("task 3", Priority.Medium)
  ];

  List<Taskitem> get dummy => _dummy;

  void additem(Taskitem taskitem) {
    dummy.add(taskitem);
    notifyListeners();
  }

//  FutureProvider<int>(create: (_)=> Futureexample().fetchdata(), initialData: 0,),
  
}

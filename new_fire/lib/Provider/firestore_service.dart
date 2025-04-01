import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_fire/Utility/enum.dart';
import '../Models/taskitem.dart';

class FirestoreService {
  final CollectionReference todosCollection =
      FirebaseFirestore.instance.collection('todos');

  Stream<List<Taskitem>> tasksStream() {
    return todosCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Taskitem(
          doc['title'] ?? 'No Title',
          Priority.values.firstWhere(
            (e) => e.title == doc['priority'],
            orElse: () => Priority.Low, // Default value
          ),
        );
      }).toList();
    });
  }

  Future<void> addTask(String title, Priority priority) async {
    await todosCollection.add({
      'title': title,
      'priority': priority.title, // Using title instead of enum string
    });
  }
}
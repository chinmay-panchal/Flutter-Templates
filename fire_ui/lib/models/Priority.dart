import 'package:flutter/material.dart';

enum Priority {
  Low(color: Colors.green, title: 'Low'),
  Medium(color: Colors.amber, title: 'Medium'),
  High(color: Colors.orange, title: 'High'),
  Urgent(color: Colors.red, title: 'Urgent'),
  Done(color: Colors.blue, title: "Done");

  const Priority({required this.color, required this.title});

  final Color color;
  final String title;
}

import 'package:flutter/material.dart';

enum Priority {
  High(Colors.red, 'high'),
  Low(Colors.green, 'low'),
  Medium(Colors.orange, 'medium');

  final Color color;
  final String title;

  const Priority(this.color, this.title);
}



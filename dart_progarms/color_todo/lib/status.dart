import 'package:flutter/material.dart';

enum Status{
  Low(color: Colors.green, title:'Low'),
  Medium(color: Colors.amber, title:'Medium'),
  High(color: Colors.orange, title:'High'),
  Urgent(color: Colors.red, title:'Urgent');

  const Status({required this.color,required this.title});

  final Color color;
  final String title;
}
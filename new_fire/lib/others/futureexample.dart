import 'dart:core';
import 'package:flutter/material.dart';

class Futureexample {
  Future<int> fetchdata() async {
    await Future.delayed(Duration(seconds: 3));
    return 3;
  }
}

import 'package:flutter/material.dart';

class Totalcount {
  ValueNotifier<int> total = ValueNotifier<int>(0);
  void inc() {
    total.value++;
  }
}

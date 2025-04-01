import 'package:flutter/material.dart';

class UserProfile with ChangeNotifier {
  String name;
  UserProfile(this.name);

  void changeUser(String newName) {
    name = newName;
    notifyListeners(); // Notify listeners when user changes
  }
}

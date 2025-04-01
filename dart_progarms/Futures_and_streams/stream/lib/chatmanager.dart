import 'package:flutter/material.dart';
import 'package:stream/userprofile.dart';

class ChatManager with ChangeNotifier {
  UserProfile user;
  List<String> messages = [];

  ChatManager(this.user);

  void sendMessage(String msg) {
    messages.add("${user.name}: $msg");
    notifyListeners(); // Notify UI to rebuild
  }

  void updateUser(UserProfile newUser) {
    user = newUser;
    notifyListeners(); // Keep the same instance but update user
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream/chatmanager.dart';
import 'package:stream/userprofile.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatManager = context.watch<ChatManager>();
    final user = context.watch<UserProfile>();

    return Scaffold(
      appBar: AppBar(title: Text("Chat (ChangeNotifierProxyProvider)")),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: chatManager.messages.map((msg) => Text(msg)).toList(),
            ),
          ),
          ElevatedButton(
            onPressed: () => chatManager.sendMessage("Hello!"),
            child: Text("Send Message"),
          ),
          ElevatedButton(
            onPressed: () {
              user.changeUser(user.name == "User A" ? "User B" : "User A");
            },
            child: Text("Change User"),
          ),
        ],
      ),
    );
  }
}

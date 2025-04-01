import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_fire/Screen/Homescreen/home_screen.dart';

class Signinservice {
    Future<void> signInAnonymously(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();
      print("Signed in: ${userCredential.user?.uid}");

      // Navigate to Anonymous screen using
      if (userCredential.user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Anonymous()),
        );
      }
    } catch (e) {
      print("Error signing in anonymously: $e");
    }
  }
}
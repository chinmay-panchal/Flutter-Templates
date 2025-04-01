import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practical/Screens/DashboardScreen/DashboardScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginprovider with ChangeNotifier {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  get emailController => _emailController;
  get passwordController => _passwordController;

  Future<void> signInWithEmailPassword(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      print("Signed in as: ${userCredential.user?.email}");

      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.setBool('isLoggedIn', true);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('uId', userCredential.user!.uid.toString());

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Dashboardscreen()),
      );
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Failed: ${e.toString()}")),
      );
    }
  }
}

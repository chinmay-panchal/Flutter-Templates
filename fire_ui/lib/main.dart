import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dashboard.dart';
import 'homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  String? uid = await getUserUID();

  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  // runApp(MyApp(isLoggedIn: isLoggedIn));
    runApp(MyApp(uid: uid));
}

class MyApp extends StatelessWidget {
  // final bool isLoggedIn;
  // const MyApp({super.key, required this.isLoggedIn});
  final String? uid;
  const MyApp({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: isLoggedIn ? DashboardScreen() : Homescreen(),
            home: uid == null ? Homescreen() : DashboardScreen(),
    );
  }
}


Future<String?> getUserUID() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('uId'); // Returns UID if exists, else null
  // print("Stored UID: $storedUid");
}

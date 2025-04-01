import 'package:flutter/material.dart';
import 'package:practice/network/AppChopperClient.dart';
import 'package:practice/screens/Homescreen/homescreen.dart';

void main() {
  ChopperClientInstance.initializeChopperClient();
  runApp(myApp());
}

class myApp extends StatefulWidget {
  const myApp({super.key});

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
















// import 'others/api_client.dart';

// void main() async {
//   // final response = await ApiClient.userService.getUsers(2);
//   final response = await ApiClient.userService.createUsers({
//     "name": "morpheus",
//     "job": "leader",
//   });

//   if (response.isSuccessful) {
//     print("Users: ${response.body}");
//   } else {
//     print("GET Error: ${response.statusCode}");
//   }
// }
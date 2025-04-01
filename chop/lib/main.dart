import 'package:chop/Network/appChopperClient.dart';
import 'package:chop/Screens/LoginScreen/LoginScreen.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';

void main() {
  ChopperClientInstance.initializeChopperClient();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}

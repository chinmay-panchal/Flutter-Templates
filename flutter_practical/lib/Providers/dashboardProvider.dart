import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter_practical/Models/userDataModel.dart';
import 'package:flutter_practical/Screens/LoginScreen/loginScreen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Dashboardprovider with ChangeNotifier {
  int selectedIndex = 0;
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  List<UserDataModel> userDataList = [];
  final searchController = TextEditingController();

  Future<void> searchFun(String value) async {
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

      if (response.statusCode == 200) {
        List<dynamic> result = jsonDecode(response.body);
        userDataList =
            result.map((json) => UserDataModel.fromJson(json)).toList();
        userDataList = userDataList
            .where((e) => (e.name?.contains(value) ?? false))
            .toList();
      } else {
        print('Something went wrong');
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchData() async {
    print("fetch data called");
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

      if (response.statusCode == 200) {
        List<dynamic> result = jsonDecode(response.body);

        userDataList =
            result.map((json) => UserDataModel.fromJson(json)).toList();
      } else {
        print('Something went wrong');
      }
    } catch (e) {
      print('Error: $e');
    }
    notifyListeners();
  }

  
  Future<void> signOut(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setBool('isLoggedIn', false);
    await prefs.remove('uId'); // Remove UID instead of boolean
    FirebaseAuth.instance.signOut();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Loginscreen()),
      (route) => false, // Remove all previous routes
    );
  }

  void selectScreen(int index) {
    selectedIndex = index;
    if (selectedIndex == 1) {
      key.currentState?.openEndDrawer();
    }
    notifyListeners();
  }
}

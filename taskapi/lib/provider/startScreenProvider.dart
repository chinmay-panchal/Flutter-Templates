import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Startscreenprovider extends ChangeNotifier {
  Future<void> postData(String email, String password) async {
    final response = await http.post(Uri.parse("https://reqres.in/api/login"),
        body: {"email": email, "password": password});

    var data = jsonDecode(response.body);
    print(data);
  }
}

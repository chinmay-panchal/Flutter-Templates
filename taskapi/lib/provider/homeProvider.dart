import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taskapi/model/userdatamodel.dart';

class HomeProvider with ChangeNotifier {
  UserDataModel? userDataModel;
  final dio = Dio();
  int pageNumber = 1;

  Future<void> fetchdio({required int number}) async {
    try {
      final qParam={
        "page":number
      };
      final response =
          await dio.get("https://reqres.in/api/users",queryParameters: 
          // {"page":number}
          qParam
          );
      if (response.statusCode == 200) {
        var body = response.data;

        userDataModel = UserDataModel.fromJson(body);
        notifyListeners();
      } else {
        print('something went wrong');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchData({required int number}) async {
    print(number);
    try {
      final response =
          await http.get(Uri.parse("https://reqres.in/api/users?page=$number"));
      var body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        print(body);
        userDataModel = UserDataModel.fromJson(body);
        // Notify UI when data changes
        // return userDataModel?.data ?? [];
      } else {
        print('Something went wrong');
        // return [];
      }
      notifyListeners();
    } catch (e) {
      print(e);
      // return [];
    }
  }

  Future<void> postData() async{
    
  }

  void nextPage() {
    pageNumber++;
    notifyListeners();
  }

  void previousPage() {
    if (pageNumber > 1) {
      pageNumber--;
      notifyListeners();
    }
  }
}

// class HomeProvider with ChangeNotifier {
//   List<Data> _users = [];
//   List<Data> get users => _users; // Getter for users

//   Future<void> fetchData() async {
//     try {
//       final response =
//           await http.get(Uri.parse("https://reqres.in/api/users?page=2"));

//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body);
//         print("API Response: $data");

//         UserDataModel userData = UserDataModel.fromJson(data);
//         _users = userData.data ?? [];

//         notifyListeners(); // Update UI
//       } else {
//         print('Something went wrong');
//       }
//     } catch (e) {
//       print("Error fetching data: $e");
//     }
//   }
// }

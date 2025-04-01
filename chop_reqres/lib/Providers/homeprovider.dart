import 'package:chop_reqres/Models/userDataModel.dart';
import 'package:chop_reqres/Utils/dataService.dart';
import 'package:flutter/material.dart';

class Homeprovider extends ChangeNotifier {
  final DataService _dataService;
  Homeprovider(this._dataService);

  List<Data>? userdata = [];

  Future<void> fetchData() async {
    try {
      final response = await _dataService.getUserData();
      if (response.isSuccessful) {
        print("succesful");
        userdata?.addAll(response.body?.data ?? []);
        // userdata?.add(response.body?.data?[0]??Data());
      } else {
        print("something went wrong");
      }
    } catch (e) {
      print("error:${e}");
    }
    notifyListeners();
  }
}

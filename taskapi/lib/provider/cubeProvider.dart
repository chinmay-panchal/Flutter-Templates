import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taskapi/model/cubeDataModel.dart';
import 'package:taskapi/model/userDataModel.dart';

class Cubeprovider with ChangeNotifier {
  CubesModelData? cubesModelData;
  List<Dimensions> dimensions = [];
  Future<void> fetchCube() async {
    try {
      final response =
          await http.get(Uri.parse("https://fargo-api.datausa.io/cubes"));
      var body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        cubesModelData = CubesModelData.fromJson(body);
        for (int i = 0; i < (cubesModelData?.cubes?.length ?? 0); i++) {
          dimensions.addAll(cubesModelData?.cubes?[i].dimensions ?? []);
        }
      } else {
        print('something went wrong');
      }
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}

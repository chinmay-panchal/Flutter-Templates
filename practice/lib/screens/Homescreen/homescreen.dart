import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:practice/models/cubesDataModel.dart';
import 'package:practice/network/AppChopperClient.dart';
import 'package:practice/utils/cubes_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CubesService cubesService =
      CubesService.create(ChopperClientInstance.client);

  // Future<void> fetchCubesData() async {
  //   try {
  //     final response = await cubesService.getCubesData();
  //     if (response.isSuccessful) {
  //       print("object");
  //       // final decodedBody = jsonDecode(response.bodyString);
  //       CubesDataModel? data = response.body;
  //       print("Fetched Data: ${data?.cubes?[0].name}");
  //     } else {
  //       print("Error: ${response.error}");
  //     }
  //   } catch (e) {
  //     print("Exception: $e");
  //   }
  // }

  Future<void> fetchData() async {
    final response = await cubesService.getCubesData();

    if (!response.isSuccessful) {
      throw Exception("Failed to fetch data: ${response.statusCode}");
    }

    CubesDataModel? data = response.body;
    print("Data: ${data?.cubes?[0].name}");
  }

  @override
  void initState() {
    super.initState();
    // fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chopper API Demo")),
      body: Center(child: Text("Fetching data... Check console.")),
    );
  }
}

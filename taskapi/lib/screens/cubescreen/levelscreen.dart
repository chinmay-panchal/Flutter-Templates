import 'package:flutter/material.dart';
import 'package:taskapi/model/cubeDataModel.dart';

class Levelscreen extends StatelessWidget {
  Levelscreen({super.key, required this.array});

  List<Levels>? array;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: array?.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      title: Text(array?[index].name??''),
                      subtitle: Text(array?[index].fullName??''),
                    );
                  }))
        ],
      ),
    );
  }
}

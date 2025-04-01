import 'package:flutter/material.dart';
import 'package:new_fire/Screen/Homescreen/Widgets/show_data.dart';
import 'package:new_fire/Screen/Homescreen/Widgets/add_data.dart';
import 'package:new_fire/Utility/enum.dart';
import 'package:new_fire/Models/taskitem.dart';
import 'package:provider/provider.dart';
import '../../Provider/firestore_service.dart';

class Anonymous extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
      appBar: AppBar(title: Text("Anonymous Tasks")),
      body: Try(),
      floatingActionButton: Try2(),
    );
  }
}
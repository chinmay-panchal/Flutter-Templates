import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Textwidget extends StatelessWidget {
  String title;
  String? val;
  Textwidget({super.key,required this.title, required this.val});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0).w,
      child: Row(
        children: [
          Text("${title}: ", style: TextStyle(fontWeight: FontWeight.bold),),
          Text("${val}"),
        ],
      ),
    );
  }
}

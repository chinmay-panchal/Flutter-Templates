import 'package:flutter/material.dart';

class Drawercommonwidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const Drawercommonwidget(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Spacer(),
            Icon(Icons.arrow_right_rounded),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class MenuCommonwidget extends StatelessWidget {
  final String image;
  final double? height;
  final BoxFit? fit;
  const MenuCommonwidget(
      {super.key, required this.image, this.height, this.fit});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      // margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: fit),
          borderRadius: BorderRadius.circular(20)),
    );
  }
}

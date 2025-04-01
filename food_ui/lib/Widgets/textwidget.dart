import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ui/Widgets/FoodCardWidget.dart';
import 'package:food_ui/cardcategory.dart';

class Textwidget extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final List<CategoryCard>? data;
  const Textwidget({super.key, required this.title, this.data, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (data?.isEmpty??false)
            ? Text(
                title ?? '',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              )
            : const SizedBox.shrink(),
        15.verticalSpace,
        GridView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: data?.length,
            itemBuilder: (context, index) => FoodCardWidget(
                  imagePath: data?[index].path,
                  name: data?[index].name,
                  starting: data?[index].starting,
                  price: data?[index].price,
                )),
        15.verticalSpace,
      ],
    );
  }
}

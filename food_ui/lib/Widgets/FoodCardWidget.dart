import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodCardWidget extends StatelessWidget {
  final String? imagePath;
  final String? name;
  final String? starting;
  final int? price;

  const FoodCardWidget(
      {super.key, this.imagePath, this.name, this.starting, this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.r,
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(8.r),
        width: 130.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                imagePath ?? '',
                height: 75.h,
                width: 95.h,
              ),
            ),
            Text(
              name ?? '',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  starting ?? '',
                  style: TextStyle(fontSize: 12.sp),
                ),
                Text(
                  '₹${price ?? 0}',
                  style: TextStyle(fontSize: 14.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

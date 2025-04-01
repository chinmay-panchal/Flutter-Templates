import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:london_yard/View/HomeScreen/Widget/menuCommonWidget.dart';

class DeliveryWidget extends StatelessWidget {
  final List<String> img;
  const DeliveryWidget({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CarouselSlider(
              items: img
                  .map((e) => MenuCommonwidget(
                        image: e,
                        height: 250,
                        fit: BoxFit.cover,
                      ))
                  .toList(),
              options: CarouselOptions(
                enlargeCenterPage: true,
                viewportFraction: 1,
                initialPage: 0,
                autoPlay: true,
              )),
          const SizedBox(
            height: 20,
          ),
          Container(
            // height: 200,
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("What would you like to order today?"),
                  Icon(Icons.search),
                ],
              ),
            ),
          ),
          GridView.builder(
              physics: const ClampingScrollPhysics(),
              itemCount: 4,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemBuilder: (ctx, index) {
                return MenuCommonwidget(
                  image: img[index],
                );
                // Container(
                //   // margin: EdgeInsets.all(10),
                //   decoration: BoxDecoration(
                //       image: DecorationImage(image: AssetImage(img[index])),
                //       borderRadius: BorderRadius.circular(20)),
                // );
              }),
        ],
      ),
    );
  }
}

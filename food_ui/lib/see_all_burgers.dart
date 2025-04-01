import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ui/Widgets/FoodCardWidget.dart';
import 'package:food_ui/Widgets/textwidget.dart';
import 'package:food_ui/cardcategory.dart';

class SeeAllBurgers extends StatelessWidget {
  const SeeAllBurgers({super.key});

  @override
  Widget build(BuildContext context) {
    data fooddata = data(message: "fetch successful", bugr: [
      CategoryCard(
          name: "Burger Bistro",
          path: 'assets/images/burger/burger1.png',
          price: 40),
      CategoryCard(
          path: 'assets/images/burger/burger2.png',
          name: 'Smokin\' Burger',
          price: 60),
      CategoryCard(
          path: 'assets/images/burger/burger3.jpg',
          name: 'Buffalo Burger',
          price: 75),
      CategoryCard(
          path: 'assets/images/burger/burger4.png',
          name: 'Bullseye Burger',
          price: 94),
    ], piz: [
      CategoryCard(
          name: "Pizza1", path: 'assets/images/pizza_pic.avif', price: 70),
      CategoryCard(
          path: 'assets/images/pizza_pic.avif', name: 'Pizza2', price: 120),
      CategoryCard(
          path: 'assets/images/pizza_pic.avif', name: 'Pizza3', price: 45),
    ], sand: [
      CategoryCard(
          name: "Sandwitch 1",
          path: 'assets/images/sandwitch_pic.jpeg',
          price: 70),
      CategoryCard(
          path: 'assets/images/sandwitch_pic.jpeg',
          name: 'Sandwitch 2',
          price: 120),
      CategoryCard(
          path: 'assets/images/sandwitch_pic.jpeg',
          name: 'Sandwitch 3',
          price: 45),
    ]);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: CircleAvatar(
            child: Icon(
              Icons.arrow_back,
              size: 15.r,
            ),
            backgroundColor: const Color.fromARGB(255, 214, 214, 214),
          ),
        ),
        title: OutlinedButton(
          onPressed: () {},
          child: Text(
            'All',
            style: TextStyle(fontSize: 12.sp, color: Colors.black),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 25.w),
            child: Row(
              children: [
                CircleAvatar(
                  child: Icon(Icons.search),
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                ),
                5.horizontalSpace,
                CircleAvatar(
                  child: Icon(Icons.filter_list),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                )
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.verticalSpace,
              // Textwidget(title: 'Popular Burgers',),
              // 15.verticalSpace,
              // GridView.builder(
              //     shrinkWrap: true,
              //     physics: ClampingScrollPhysics(),
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2,
              //     ),
              //     itemCount: fooddata.bugr?.length,
              //     itemBuilder: (context, index) => FoodCardWidget(
              //           imagePath: fooddata.bugr?[index].path,
              //           name: fooddata.bugr?[index].name,
              //           starting: fooddata.bugr?[index].starting,
              //           price: fooddata.bugr?[index].price,
              //         )),
              // 15.verticalSpace,
              Textwidget(
                title: 'Popular Burgers',
                data: fooddata.bugr ?? [],
                icon: Icons.snowing,
              ),
              Textwidget(title: 'Popular Pizzas', data: fooddata.piz ?? []),
              Textwidget(
                  title: 'Popular Sandwitches', data: fooddata.sand ?? []),
            ],
          ),
        ),
      ),
    );
  }
}

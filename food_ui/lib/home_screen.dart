import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ui/cardcategory.dart';
import 'package:food_ui/see_all_burgers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  List<CategoryCard> dummy = [
    CategoryCard(
        name: "Burger", path: 'assets/images/burger_pic.avif', price: 70),
    CategoryCard(
        path: 'assets/images/pizza_pic.avif', name: 'Pizza', price: 120),
    CategoryCard(
        path: 'assets/images/sandwitch_pic.jpeg', name: 'Sandwitch', price: 45),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: const Icon(Icons.menu),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'DELEIVER TO',
                style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Chinmay Lab office',
                style: TextStyle(fontSize: 12.sp),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 25.w),
              child: const Icon(Icons.shopping_basket),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              children: [
                20.verticalSpace,
                Row(
                  children: [
                    Text(
                      'Hey Chinmay, ',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    Text(
                      'Good Afternoon!',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                10.verticalSpace,
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 224, 224, 224),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  height: 45.h,
                  child: Padding(
                    padding: EdgeInsets.all(8.r),
                    child: Row(
                      children: [
                        Icon(Icons.search),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search dishes, restaurants',
                              hintStyle: TextStyle(fontSize: 12.sp),
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.only(left: 5.w, bottom: 16.h),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                10.verticalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'All Categories',
                          style: TextStyle(fontSize: 16.sp),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            foregroundColor: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SeeAllBurgers()));
                          },
                          child: Row(
                            children: [
                              Text(
                                'See All',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              Icon(
                                Icons.navigate_next_sharp,
                                size: 22.sp,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    5.verticalSpace,
                    SizedBox(
                      height: 160.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: dummy.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Card(
                          elevation: 3.r,
                          color: Colors.white,
                          child: Container(
                            padding: EdgeInsets.all(4.r),
                            width: 140.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image.asset(
                                    dummy[index].path,
                                    height: 95.h,
                                    width: 95.h,
                                  ),
                                ),
                                Text(
                                  dummy[index].name,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      dummy[index].starting,
                                      style: TextStyle(fontSize: 12.sp),
                                    ),
                                    Text(
                                      '₹' + dummy[index].price.toString(),
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    20.verticalSpace,
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Open Restaurants',
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              foregroundColor: Colors.black,
                            ),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Text(
                                  'See All',
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                                Icon(
                                  Icons.navigate_next_sharp,
                                  size: 22.sp,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    5.verticalSpace,
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(14.r),
                    //   child: SizedBox(
                    //     height: 150.h,
                    //     width: double.infinity,
                    //     child: Image.asset(
                    //       'assets/images/restaurant_pic.webp',
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                    Container(
                      height: 150.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/images/restaurant_pic.webp',
                              ),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(14.r)),
                    ),

                    5.verticalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rose Garden Restaurant',
                          style: TextStyle(fontSize: 16.sp),
                        ),
                        Text(
                          'Burger - Chicken - Riche - Wings',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        SizedBox(
                          height: 50.h,
                          child: Row(
                            children: [
                              Icon(
                                Icons.star_border,
                                color: Colors.deepOrange,
                              ),
                              5.horizontalSpace,
                              Text('4.7'),
                              15.horizontalSpace,
                              Icon(
                                Icons.fire_truck_rounded,
                                color: Colors.deepOrange,
                              ),
                              5.horizontalSpace,
                              Text('Free'),
                              15.horizontalSpace,
                              Icon(
                                Icons.access_time_filled_rounded,
                                color: Colors.deepOrange,
                              ),
                              5.horizontalSpace,
                              Text('20 min'),
                            ],
                          ),
                        )
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14.r),
                      child: SizedBox(
                        height: 150.h,
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/restaurant2_pic.avif',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    5.verticalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Uttora Cofee House',
                          style: TextStyle(fontSize: 16.sp),
                        ),
                        Text(
                          'Burger - SandWitch - Riche - Wings',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        SizedBox(
                          height: 50.h,
                          child: Row(
                            children: [
                              Icon(
                                Icons.star_border,
                                color: Colors.deepOrange,
                              ),
                              5.horizontalSpace,
                              Text('4.7'),
                              15.horizontalSpace,
                              Icon(
                                Icons.fire_truck_rounded,
                                color: Colors.deepOrange,
                              ),
                              5.horizontalSpace,
                              Text('Free'),
                              15.horizontalSpace,
                              Icon(
                                Icons.access_time_filled_rounded,
                                color: Colors.deepOrange,
                              ),
                              5.horizontalSpace,
                              Text('20 min'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

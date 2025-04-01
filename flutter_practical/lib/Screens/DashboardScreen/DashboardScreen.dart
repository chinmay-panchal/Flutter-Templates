import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practical/Providers/dashboardProvider.dart';
import 'package:flutter_practical/Providers/themeProvider.dart';
import 'package:flutter_practical/Screens/DashboardScreen/Widgets/textWidget.dart';
import 'package:flutter_practical/Screens/LoginScreen/loginScreen.dart';
import 'package:flutter_practical/Models/userDataModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboardscreen extends StatefulWidget {
  const Dashboardscreen({super.key});

  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {
  // int _selectedIndex = 0;
  // final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  // List<UserDataModel> userDataList = []; // Store a list of users
  // bool val = false;

  // @override
  // void initState() {
  //   super.initState();
  //   fetchData();
  // }

  // Future<void> fetchData() async {
  //   try {
  //     final response = await http
  //         .get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

  //     if (response.statusCode == 200) {
  //       List<dynamic> result = jsonDecode(response.body);

  //       setState(() {
  //         userDataList =
  //             result.map((json) => UserDataModel.fromJson(json)).toList();
  //       });
  //     } else {
  //       print('Something went wrong');
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }

  // void _selectScreen(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //     if (_selectedIndex == 1) {
  //       key.currentState?.openEndDrawer();
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    print("width: ${MediaQuery.sizeOf(context).width}");
    print("height: ${MediaQuery.sizeOf(context).height}");

    return ChangeNotifierProvider(
        create: (_) => Dashboardprovider(),
        builder: (context, child) {
          context.read<Dashboardprovider>().fetchData();

          return Scaffold(
            key: context.read<Dashboardprovider>().key,
            endDrawer: Drawer(
              child: Column(
                children: [
                  ListTile(
                    title: Padding(
                      padding: EdgeInsets.all(18.0).w,
                      child:
                          Text('Logout', style: TextStyle(color: Colors.red)),
                    ),
                    onTap: () =>
                        context.read<Dashboardprovider>().signOut(context),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Dark Mode"),
                    trailing: Consumer<Themeprovider>(
                      builder: (context, themeProvider, child) {
                        return Switch(
                          value: themeProvider.themeMode == ThemeMode.dark,
                          onChanged: (value) {
                            themeProvider.setTheme(
                                value ? ThemeMode.dark : ThemeMode.light);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            body: Consumer<Dashboardprovider>(builder: (context, value, child) {
              return value.userDataList.isNotEmpty
                  ? Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(18),
                          height: 50.h,
                          width: double.maxFinite,
                          decoration: BoxDecoration(border: Border.all()),
                          child: Row(
                            children: [
                              Icon(Icons.search),
                              Flexible(
                                child: TextField(
                                  controller: value.searchController,
                                  onChanged: value.searchFun,
                                  decoration: InputDecoration(
                                      hintText: "Search",
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: value.userDataList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(18.0).w,
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Textwidget(
                                          title: "Name",
                                          val: value.userDataList[index].name),
                                      Textwidget(
                                          title: "Email",
                                          val: value.userDataList[index].email),
                                      Textwidget(
                                          title: "Phone",
                                          val: value.userDataList[index].phone),
                                      Textwidget(
                                          title: "Address",
                                          val:
                                              "${value.userDataList[index].address?.street}, ${value.userDataList[index].address?.city}"),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
                  : Center(child: CircularProgressIndicator());
            }),
            bottomNavigationBar: BottomNavigationBar(
              onTap: context.read<Dashboardprovider>().selectScreen,
              currentIndex: context.read<Dashboardprovider>().selectedIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.first_page),
                  label: "Drawer",
                ),
              ],
            ),
          );
        });
  }
}

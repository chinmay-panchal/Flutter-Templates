import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskapi/provider/cubeProvider.dart';
import 'package:taskapi/provider/startScreenProvider.dart';

class Startscreen extends StatelessWidget {
  const Startscreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var startscreenprovider =
    //     Provider.of<Startscreenprovider>(context, listen: false);
    var emailcontroller = TextEditingController();
    var passcontroller = TextEditingController();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Startscreenprovider()),
        ChangeNotifierProvider(create: (_) => Cubeprovider()),
      ],
      builder: (context, child) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: emailcontroller,
                decoration: InputDecoration(
                    hintText: "Enter Email Id",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
              SizedBox(height: 10),
              TextField(
                controller: passcontroller,
                decoration: InputDecoration(
                    hintText: "Enter Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap:() => 
                // context.read<Startscreenprovider>().postData(emailcontroller.text, passcontroller.text),
                context.read<Cubeprovider>().fetchCube(),
                child: Container(
                  height: 45,
                  width: double.infinity,
                  child: Center(child: Text("Login")),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

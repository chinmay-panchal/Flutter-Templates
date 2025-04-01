import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practical/Providers/loginProvider.dart';
import 'package:flutter_practical/Screens/DashboardScreen/DashboardScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Loginscreen extends StatelessWidget {
  Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>Loginprovider(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(38.0).w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: context.read<Loginprovider>().emailController,
                decoration: InputDecoration(hintText: "Email"),
              ),
              TextField(
                controller: context.read<Loginprovider>().passwordController,
                decoration: InputDecoration(hintText: "Password"),
              ),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                onTap: () => context.read<Loginprovider>().signInWithEmailPassword,
                child: Container(
                  height: 40.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12).r,
                      color: Colors.orange),
                  child: Center(
                    child: Text("Login"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

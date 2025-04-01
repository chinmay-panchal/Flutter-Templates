import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_fire/Provider/signinservice.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    var signinservice = Provider.of<Signinservice>(context, listen: false);

    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image:
              AssetImage('assets/images/fire_ui_login.webp'), 
          fit: BoxFit
              .cover, 
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
               signinservice.signInAnonymously(context);
              },
              child: Text('Sign in '))
        ],
      ),
    ));
  }
}

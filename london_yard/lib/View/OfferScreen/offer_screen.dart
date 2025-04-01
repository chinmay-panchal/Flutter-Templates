import 'package:flutter/material.dart';

class OfferScreen extends StatelessWidget {
  const OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 140,
              width: 140,
              color: Colors.blue,
              child: Text('Hello'),
            ),
            const Spacer(flex: 1,),
            Container(
              height: 140,
              width: 140,
              color: Colors.green,
              child: Text('By'),
            )
          ],
        ),
      ),
    );
  }
}

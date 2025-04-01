import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:london_yard/View/CartScreen/cart_screen.dart';
import 'package:london_yard/View/HomeScreen/home_screen.dart';
import 'package:london_yard/View/LoyaltyScreen/loyalty_screen.dart';
import 'package:london_yard/View/OfferScreen/offer_screen.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int currentIndex = 0;
/// for Navigation
 void navigations(int index) {
    currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        switch (currentIndex) {
          case 0:
            return const HomeScreen();
            break;
          case 1:
            return const OfferScreen();
            break;
          case 2:
            return const LoyaltyScreen();
            break;
          case 3:
            return const CartScreen();
            break;

          default:
            return const CupertinoTabView();
        }
      }),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        unselectedItemColor: Colors.grey[400],
        selectedItemColor: Colors.red,
        onTap: navigations,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.airplane_ticket,
            ),
            label: "Offers",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.wallet,
            ),
            label: "Loyalty",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag,
            ),
            label: "Cart",
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_deliver_app/Scrren/main_screen/cartr_screen/cart_screen.dart';
import 'package:food_deliver_app/Scrren/main_screen/homescrren/homepage.dart';
import 'package:food_deliver_app/Scrren/main_screen/profile_screen/profile_Screen.dart';
import 'package:food_deliver_app/Scrren/main_screen/search_screen/search_screen.dart';
import 'package:food_deliver_app/util/app_colors.dart';
import 'package:food_deliver_app/util/conston.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomePage(),
    const SearchScreen(),
    const CartScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBg,
      body:
          _screens.elementAt(_currentIndex), // using index value nevigate page
      bottomNavigationBar: Container(
        height: 90,
        color: kwhite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavTile(
              icon: 'home.png',
              isselected: _currentIndex == 0,
              ontap: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            BottomNavTile(
              icon: 'search.png',
              isselected: _currentIndex == 1,
              ontap: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
            ),
            BottomNavTile(
              icon: 'cart.png',
              isselected: _currentIndex == 2,
              ontap: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
            ),
            BottomNavTile(
              icon: 'user.png',
              isselected: _currentIndex == 3,
              ontap: () {
                setState(() {
                  _currentIndex = 3;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavTile extends StatelessWidget {
  const BottomNavTile(
      {super.key,
      required this.icon,
      required this.isselected,
      required this.ontap});

  final String icon;
  final bool isselected;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ontap,
        child: Container(
            padding: const EdgeInsets.all(15),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: isselected ? primaryColor : kwhite,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(Constans.iconassest(icon))));
  }
}

import 'package:ecommerce_app/pages/detail_page.dart';
import 'package:ecommerce_app/pages/home_page.dart';
import 'package:ecommerce_app/pages/my_fav_page.dart';
import 'package:ecommerce_app/pages/mybag_page.dart';
import 'package:ecommerce_app/pages/shop_page.dart';
import 'package:flutter/material.dart';

class BottomNavbarPage extends StatefulWidget {
  const BottomNavbarPage({super.key});

  @override
  State<BottomNavbarPage> createState() => _BottomNavbarPageState();
}

class _BottomNavbarPageState extends State<BottomNavbarPage> {
  List<Widget> pages = [
    HomePage(),
    ShopPage(),
    MybagPage(),
    MyFavPage(),
    DetailPage()
  ];
  int activeIndex = 0;
  late VoidCallbackAction voidCallbackAction;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[activeIndex],
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black54,
          selectedIconTheme: IconThemeData(
              color: Colors.red, applyTextScaling: true, size: 25),
          selectedItemColor: Colors.red,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: activeIndex,
          onTap: (index) {
            activeIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(
                  Icons.home,
                )),
            BottomNavigationBarItem(
                label: 'Cart',
                icon: Icon(
                  Icons.shopping_cart,
                )),
            BottomNavigationBarItem(
                label: 'Bag',
                icon: Icon(
                  Icons.shopping_bag,
                )),
            BottomNavigationBarItem(
                label: 'Favorite',
                icon: Icon(
                  Icons.favorite,
                )),
            BottomNavigationBarItem(
                label: 'profile',
                icon: Icon(
                  Icons.person,
                )),
          ]),
    );
  }
}

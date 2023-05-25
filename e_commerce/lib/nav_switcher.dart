import 'package:e_commerce/presentation/cart/cart_screen.dart';
import 'package:e_commerce/presentation/home/home_screen.dart';
import 'package:e_commerce/presentation/settings/settings_screen.dart';
import 'package:e_commerce/presentation/categories/categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class NavSwitcher extends StatefulWidget {
  const NavSwitcher({super.key});
  static const String routeName = 'nav';

  @override
  State<NavSwitcher> createState() => _NavSwitcherState();
}

class _NavSwitcherState extends State<NavSwitcher> {
  int selectedIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    SettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: [
            const BottomNavigationBarItem(
                icon: Icon(IconlyLight.home),
                label: "Home",
                backgroundColor: Colors.black),
            const BottomNavigationBarItem(
              icon: Icon(IconlyLight.category),
              label: "Wishlist",
            ),
            const BottomNavigationBarItem(
              icon: Icon(IconlyLight.bag),
              label: "cart",
            ),
            const BottomNavigationBarItem(
              icon: Icon(IconlyLight.profile),
              label: "User",
            ),
          ]),
    );
  }
}

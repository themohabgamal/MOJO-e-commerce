import 'package:e_commerce/presentation/home/home_screen.dart';
import 'package:e_commerce/presentation/notifications/notifications_screen.dart';
import 'package:e_commerce/presentation/user/user_screen.dart';
import 'package:e_commerce/presentation/wishlist/wish_list_screen.dart';
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
    WishListScreen(),
    NotificationScreen(),
    UserScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
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
            ),
            const BottomNavigationBarItem(
              icon: Icon(IconlyLight.heart),
              label: "Wishlist",
            ),
            const BottomNavigationBarItem(
              icon: Icon(IconlyLight.notification),
              label: "notifications",
            ),
            const BottomNavigationBarItem(
              icon: Icon(IconlyLight.user),
              label: "User",
            ),
          ]),
    );
  }
}

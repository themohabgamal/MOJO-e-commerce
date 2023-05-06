import 'package:e_commerce/nav_switcher.dart';
import 'package:e_commerce/presentation/cart/cart_screen.dart';
import 'package:e_commerce/presentation/home/home_screen.dart';
import 'package:e_commerce/theming/theme.dart';
import 'package:e_commerce/widgets/single_product_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inlit',
      theme: MyTheme.lightTheme,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        NavSwitcher.routeName: (context) => const NavSwitcher(),
        CartScreen.routeName: (context) => const CartScreen(),
        SingleProductPage.routeName: (context) => SingleProductPage(),
      },
      initialRoute: NavSwitcher.routeName,
    );
  }
}

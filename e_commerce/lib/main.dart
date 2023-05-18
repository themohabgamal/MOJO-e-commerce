import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/nav_switcher.dart';
import 'package:e_commerce/presentation/boarding/on_boarding_screen.dart';
import 'package:e_commerce/presentation/home/home_screen.dart';
import 'package:e_commerce/presentation/home/hot_deals_page.dart';
import 'package:e_commerce/presentation/home_checker.dart';
import 'package:e_commerce/presentation/wishlist/wish_list_screen.dart';
import 'package:e_commerce/theming/theme.dart';
import 'package:e_commerce/widgets/cart_single_product_page.dart';
import 'package:e_commerce/widgets/categories_single_product_page.dart';
import 'package:e_commerce/widgets/single_product_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isViewed;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard');
  await prefs.setInt('onBoard', 1);
  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Inlit',
      theme: MyTheme.lightTheme,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        NavSwitcher.routeName: (context) => const NavSwitcher(),
        SingleProductPage.routeName: (context) => SingleProductPage(),
        CartSingleProductPage.routeName: (context) => CartSingleProductPage(),
        HotDealsPage.routeName: (context) => HotDealsPage(),
        WishListScreen.routeName: (context) => WishListScreen(),
        CategoriesSingleProductPage.routeName: (context) =>
            CategoriesSingleProductPage(),
        OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
        HomeChecker.routeName: (context) => HomeChecker(),
      },
      // initialRoute: OnBoardingScreen.routeName,
      initialRoute: isViewed == 0 || isViewed == null
          ? OnBoardingScreen.routeName
          : NavSwitcher.routeName,
    );
  }
}

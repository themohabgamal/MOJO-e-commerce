import 'package:e_commerce/presentation/about_us.dart';
import 'package:e_commerce/presentation/home_checker.dart';
import 'package:flutter/material.dart';

class NonAuthenticatedScreen extends StatefulWidget {
  const NonAuthenticatedScreen({super.key});

  @override
  State<NonAuthenticatedScreen> createState() => _NonAuthenticatedScreenState();
}

class _NonAuthenticatedScreenState extends State<NonAuthenticatedScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              leading: Icon(
                Icons.login,
                color: Theme.of(context).textTheme.headline6?.color,
              ),
              title: Text(
                'Login / signup',
                style: Theme.of(context).textTheme.headline6,
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, HomeChecker.routeName);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.info_outline,
                color: Theme.of(context).textTheme.headline6?.color,
              ),
              title: Text(
                'About Us',
                style: Theme.of(context).textTheme.headline6,
              ),
              onTap: () {
                Navigator.pushNamed(context, AboutUsScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}

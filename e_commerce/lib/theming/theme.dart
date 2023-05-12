import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static const mainColor = Color(0xFF0D6EFD);
  static const darkGreyColor = Color(0xFF6A6A6A);
  static const lighterColor = Color.fromARGB(255, 247, 247, 247);
  static const darkColor = Color.fromARGB(255, 37, 37, 37);
  static const orangeColor = Color(0xFFFf4c24);
  static final lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: lighterColor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.raleway(
            fontSize: 16, fontWeight: FontWeight.w600, color: darkColor),
      ),
      scaffoldBackgroundColor: lighterColor,
      textTheme: TextTheme(
        headline6: GoogleFonts.raleway(
            fontSize: 18,
            color: MyTheme.darkColor,
            decoration: TextDecoration.none),
        headline5: GoogleFonts.raleway(
            fontSize: 20,
            color: MyTheme.darkColor,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.none),
        headline4: GoogleFonts.raleway(
            fontSize: 24,
            color: MyTheme.darkColor,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.none),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(size: 30, color: mainColor),
          unselectedIconTheme: IconThemeData(size: 30, color: darkGreyColor),
          elevation: 0));
}

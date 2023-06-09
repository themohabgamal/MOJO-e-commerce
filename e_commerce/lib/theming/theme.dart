import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static const mainColor = Color(0xFF0E6CFF);
  static const darkGreyColor = Color(0xFF16182C);
  static const lighterColor = Color.fromARGB(255, 229, 229, 229);
  static const darkColor = Color.fromARGB(255, 37, 37, 37);
  static const orangeColor = Color(0xFFFf4c24);
  static const darkMain = Color.fromARGB(255, 26, 26, 26);
  static const darkSec = Color.fromARGB(255, 43, 43, 43);
  static final lightTheme = ThemeData(
      canvasColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: darkColor),
        centerTitle: true,
        titleTextStyle: GoogleFonts.raleway(
            fontSize: 16, fontWeight: FontWeight.w600, color: darkColor),
      ),
      scaffoldBackgroundColor: Colors.white,
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
        subtitle2: GoogleFonts.raleway(
            fontSize: 22,
            color: MyTheme.darkColor,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.none),
        subtitle1: GoogleFonts.raleway(
            fontSize: 18,
            color: MyTheme.darkColor,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.none),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white70,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(size: 30, color: mainColor),
          unselectedIconTheme: IconThemeData(size: 30, color: darkGreyColor),
          elevation: 0));
  static final darkTheme = ThemeData(
      splashColor: Colors.transparent,
      canvasColor: Color.fromARGB(255, 43, 43, 43),
      appBarTheme: AppBarTheme(
        backgroundColor: darkMain,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        titleTextStyle: GoogleFonts.raleway(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
      ),
      scaffoldBackgroundColor: darkMain,
      textTheme: TextTheme(
        headline6: GoogleFonts.raleway(
            fontSize: 18, color: Colors.white, decoration: TextDecoration.none),
        headline5: GoogleFonts.raleway(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.none),
        headline4: GoogleFonts.raleway(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.none),
        subtitle2: GoogleFonts.raleway(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.none),
        subtitle1: GoogleFonts.raleway(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.none),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: darkSec,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: IconThemeData(size: 30, color: mainColor),
          unselectedIconTheme: IconThemeData(size: 30, color: Colors.white),
          elevation: 0));
}

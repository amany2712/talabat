import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFFF55540);

  static const Color lightBackground = Color(0xFFF7F7F7);
  static const Color darkBackground = Colors.black;

  static const Color lightGrey = Color(0xFFF3F4F6);
  static const Color white = Colors.white;
  static const Color black = Colors.black;


  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: lightBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: lightBackground,
      foregroundColor: black,
  ),
   bottomNavigationBarTheme: const BottomNavigationBarThemeData(
     backgroundColor: lightBackground,
     selectedItemColor: primaryColor,
     unselectedItemColor: black,
   ),
   textTheme: TextTheme(
    bodyLarge: TextStyle(
      color: black
    ),
    bodyMedium: TextStyle(
      color: black
    )
   )
  );

  ///dark mode
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: darkBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: darkBackground,
      foregroundColor: white,
  ),
   bottomNavigationBarTheme: const BottomNavigationBarThemeData(
     backgroundColor: darkBackground,
     selectedItemColor: primaryColor,
     unselectedItemColor:white,
   ),
   textTheme: TextTheme(
    bodyLarge: TextStyle(
      color: white
    ),
    bodyMedium: TextStyle(
      color: white
    )
   )
  );



}
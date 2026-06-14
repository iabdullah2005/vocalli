import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(

  brightness: Brightness.light,

  scaffoldBackgroundColor: const Color(0xFFF8FAFC),

  primaryColor: Colors.blueAccent,

  cardColor: Colors.white,

  fontFamily: 'Poppins',

  textTheme: const TextTheme(

    bodyLarge: TextStyle(
      color: Color(0xFF0F172A),
    ),

    bodyMedium: TextStyle(
      color: Color(0xFF334155),
    ),
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFF8FAFC),
    elevation: 0,
  ),

  bottomNavigationBarTheme:
  const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Colors.blueAccent,
    unselectedItemColor: Colors.grey,
  ),
);
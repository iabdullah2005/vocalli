import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(

  brightness: Brightness.dark,

  scaffoldBackgroundColor: const Color(0xFF0F172A),

  primaryColor: Colors.blueAccent,

  cardColor: const Color(0xFF1E293B),

  fontFamily: 'Poppins',

  textTheme: const TextTheme(

    bodyLarge: TextStyle(
      color: Colors.white,
    ),

    bodyMedium: TextStyle(
      color: Colors.white70,
    ),
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF0F172A),
    elevation: 0,
  ),

  bottomNavigationBarTheme:
  const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF111827),
    selectedItemColor: Colors.blueAccent,
    unselectedItemColor: Colors.white54,
  ),
);
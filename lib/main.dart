import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';

import 'theme/dark_theme.dart';
import 'theme/light_theme.dart';

void main() async {

  runApp(const VocaliApp());
}

class VocaliApp extends StatefulWidget {
  const VocaliApp({super.key});

  static _VocaliAppState? of(BuildContext context) {

    return context.findAncestorStateOfType<_VocaliAppState>();
  }

  @override
  State<VocaliApp> createState() => _VocaliAppState();
}

class _VocaliAppState extends State<VocaliApp> {

  ThemeMode currentThemeMode = ThemeMode.system;

  void changeTheme(ThemeMode mode) {

    setState(() {
      currentThemeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Vocali',

      theme: lightTheme,

      darkTheme: darkTheme,

      themeMode: currentThemeMode,

      home: const SplashScreen(),
    );
  }
}
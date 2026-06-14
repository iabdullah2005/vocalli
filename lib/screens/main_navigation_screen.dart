import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'practice_screen.dart';
import 'progress_screen.dart';
import 'settings_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() =>
      _MainNavigationScreenState();
}

class _MainNavigationScreenState
    extends State<MainNavigationScreen> {

  int currentIndex = 0;

  final List<Widget> screens = const [
    HomeScreen(),
    PracticeScreen(),
    ProgressScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // FIX: was hardcoded Color(0xFF0F172A)
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        // FIX: removed hardcoded colors, now uses theme
        backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        selectedItemColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        unselectedItemColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        iconSize: 28,

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.mic_rounded),
            label: 'Practice',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_rounded),
            label: 'Progress',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

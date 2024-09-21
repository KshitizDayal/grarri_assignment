import 'package:flutter/material.dart';
import 'package:grarri_ds/grarri_ds.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'screens/bottom_navigation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grarri Assignment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: DsColors.colorF1F1F1,
        appBarTheme: const AppBarTheme(
          color: DsColors.colorF0F3F1,
          surfaceTintColor: Colors.transparent,
        ),
        useMaterial3: true,
      ),
      home: ResponsiveBreakpoints.builder(breakpoints: [
        const Breakpoint(start: 0, end: 450, name: MOBILE),
        const Breakpoint(start: 451, end: 800, name: TABLET),
        const Breakpoint(start: 801, end: 1920, name: DESKTOP),
        const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
      ], child: const BottomNavigationScreen()),
    );
  }
}

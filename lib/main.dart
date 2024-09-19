import 'package:flutter/material.dart';
import 'package:grarri_ds/grarri_ds.dart';

import 'screens/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grarri Assignment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: DsColors.colorF1F1F1,
        appBarTheme: const AppBarTheme(
          color: DsColors.colorF0F3F1,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

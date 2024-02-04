import 'package:flutter/material.dart';
import 'package:towpall/screens/splash_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TowPaLL",
      home: SplashScreen(),
    );
  }
}
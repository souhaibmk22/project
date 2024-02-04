import 'package:flutter/material.dart';
import 'package:towpall/screens/splash_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
//just a simple command to virify my branch if it works
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TowPaLL",
      home: SplashScreen(),
    );
  }
}

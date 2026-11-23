import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const K3MiniDelightApp());
}

class K3MiniDelightApp extends StatelessWidget {
  const K3MiniDelightApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'K3 Mini Delight',

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF633621),
        ),
        scaffoldBackgroundColor: const Color(0xFFFFF9F3),
      ),

      home: const SplashScreen(),
    );
  }
}

import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';

import 'package:provider/provider.dart';

import 'providers/cart_provider.dart';

import 'providers/favorite_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
      ],
      child: const K3MiniDelightApp(),
    ),
  );
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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF633621)),
        scaffoldBackgroundColor: const Color(0xFFFFF9F3),
      ),

      home: const SplashScreen(),
    );
  }
}

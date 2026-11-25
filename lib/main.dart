import 'package:flutter/material.dart';

import 'constants/app_colors.dart';
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
      builder: (context, child) {
        return ColoredBox(
          color: AppColors.background,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final appWidth = constraints.maxWidth
                  .clamp(0.0, 480.0)
                  .toDouble();
              final appHeight = constraints.maxHeight;
              final mediaQuery = MediaQuery.of(context);

              return Center(
                child: SizedBox(
                  width: appWidth,
                  height: appHeight,
                  child: MediaQuery(
                    data: mediaQuery.copyWith(size: Size(appWidth, appHeight)),
                    child: child ?? const SizedBox.shrink(),
                  ),
                ),
              );
            },
          ),
        );
      },

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        scaffoldBackgroundColor: AppColors.background,
      ),

      home: const SplashScreen(),
    );
  }
}

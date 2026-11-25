import 'dart:async';

import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Automatically proceed after 3 seconds
    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Top decorative shape
          Positioned(
            top: -90,
            left: -60,
            child: Container(
              width: 250,
              height: 250,
              decoration: const BoxDecoration(
                color: AppColors.chipBackground,
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Bottom decorative shape
          Positioned(
            bottom: -100,
            right: -70,
            child: Container(
              width: 270,
              height: 270,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Main content
          Center(
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.7, end: 1.0),
              duration: const Duration(milliseconds: 900),
              curve: Curves.easeOutBack,
              builder: (context, value, child) {
                return Transform.scale(scale: value, child: child);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo
                  Container(
                    width: 115,
                    height: 115,
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadow.withValues(alpha: 0.10),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.cake_rounded,
                      size: 65,
                      color: AppColors.primary,
                    ),
                  ),

                  const SizedBox(height: 22),

                  // Brand name
                  const Text(
                    'K3',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      color: AppColors.primary,
                      letterSpacing: 3,
                    ),
                  ),

                  const Text(
                    'Mini Delight',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Tagline
                  const Text(
                    'Sweet Bites, Mini Delights!',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.brandAccent,
                      letterSpacing: 0.5,
                    ),
                  ),

                  const SizedBox(height: 45),

                  // Loading indicator
                  const SizedBox(
                    width: 28,
                    height: 28,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      color: AppColors.loadingIndicator,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

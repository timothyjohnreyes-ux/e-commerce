import 'dart:async';

import 'package:flutter/material.dart';

import 'home_screen.dart';

class TransitionScreen extends StatefulWidget {
  const TransitionScreen({super.key});

  @override
  State<TransitionScreen> createState() => _TransitionScreenState();
}

class _TransitionScreenState extends State<TransitionScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..forward();
    _navigationTimer = Timer(const Duration(milliseconds: 1200), _goToHome);
  }

  void _goToHome() {
    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (context, animation, secondaryAnimation) =>
            const HomeScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9F3),
      body: Center(
        child: ScaleTransition(
          scale: CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOutBack,
          ),
          child: FadeTransition(
            opacity: _controller,
            child: Container(
              width: 118,
              height: 118,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF633621).withValues(alpha: 0.14),
                    blurRadius: 30,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: const Icon(
                Icons.cake_rounded,
                size: 64,
                color: Color(0xFF633621),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

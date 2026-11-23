import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() {
    return _OnboardingScreenState();
  }
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF9F3),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: double.infinity,
                            constraints: const BoxConstraints(
                              maxWidth: 360,
                              maxHeight: 300,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFE2CF),
                              borderRadius: BorderRadius.circular(32),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF633621).withValues(alpha: 0.12),
                                  blurRadius: 24,
                                  offset: const Offset(0, 12),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(32),
                              child: Image.asset(
                                'assets/images/Mini Donut-Chocolate.jpg',
                                height: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          const SizedBox(height: 28),

                          const Text(
                            'Discover Sweet Mini Treats',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 28,
                              height: 1.15,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF633621),
                            ),
                          ),

                          const SizedBox(height: 12),

                          const Text(
                            'Little bites of happiness, made for every sweet moment.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.5,
                              color: Color(0xFF8B5E48),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Center(child: Text('Freshly Made with Love')),
                  Center(child: Text('Order with Ease')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

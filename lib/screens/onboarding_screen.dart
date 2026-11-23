import 'package:flutter/material.dart';

import 'transition_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() {
    return _OnboardingScreenState();
  }
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _goToTransition() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) =>
            const TransitionScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'K3',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF633621),
                        ),
                      ),

                      Text(
                        'MINI DELIGHT',
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF633621),
                        ),
                      ),
                    ],
                  ),

                  TextButton(
                    onPressed: _goToTransition,
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF633621),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  _OnboardingPage(
                    imagePath: 'assets/images/Waffle-Chocolate.jpg',
                    eyebrow: 'Fresh from the kitchen',
                    title: 'Sweet Bites,\nHappy Moments',
                    description: 'Discover freshly made mini treats that are perfect for every craving.',
                  ),

                  const _OnboardingPage(
                    imagePath: 'assets/images/Pancake-Matcha.jpg',
                    eyebrow: 'Made with love',
                    title: 'Freshly Made\nEvery Day',
                    description: 'Enjoy warm waffles, soft pancakes, and delightful bites made just for you.',
                  ),

                  const _OnboardingPage(
                    imagePath: 'assets/images/Soda-Lemon.jpg',
                    eyebrow: 'Easy and delicious',
                    title: 'Order Your\nFavorite Treat',
                    description: 'Choose your favorites and satisfy your sweet cravings in just a few taps.',
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 28),
              child: Row(
                children: [
                  Row(
                    children: List.generate(3, (index) {
                      final isActive = index == _currentPage;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: const EdgeInsets.only(right: 6),
                        width: isActive ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: isActive
                              ? const Color(0xFF633621)
                              : const Color(0xFFDCC6B8),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      );
                    }),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      if (_currentPage < 2) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 350),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        _goToTransition();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF633621),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      minimumSize: const Size(140, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(_currentPage == 2 ? 'Get Started' : 'Next'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String eyebrow;
  final String title;
  final String description;

  const _OnboardingPage({
    required this.imagePath,
    required this.eyebrow,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 300,
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
                imagePath,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
          const SizedBox(height: 28),

          Text(
            eyebrow.toUpperCase(),
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.8,
              color: Color(0xFFB16A45),
            ),
          ),
          const SizedBox(height: 10),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              height: 1.12,
              fontWeight: FontWeight.w800,
              color: Color(0xFF633621),
            ),
          ),
          const SizedBox(height: 12),

          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              height: 1.55,
              color: Color(0xFF8B6F61),
            ),
          ),
        ],
      ),
    );
  }
}

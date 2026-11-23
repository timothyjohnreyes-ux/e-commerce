import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9F3),
      appBar: AppBar(
        title: const Text('Our Menu'),
        backgroundColor: const Color(0xFFFFF9F3),
        foregroundColor: const Color(0xFF633621),
      ),
      body: const Center(
        child: Text(
          'Our delicious treats are coming soon! 🍩',
          style: TextStyle(fontSize: 16, color: Color(0xFF633621)),
        ),
      ),
    );
  }
}

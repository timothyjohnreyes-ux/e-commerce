
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9F3),
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Color(0xFF633621),
          ),
        ),
        backgroundColor: const Color(0xFFFFF9F3),
        foregroundColor: const Color(0xFF633621),
        elevation: 0,
      ),
      body: const Center(
        child: Text(
          'Welcome to your profile!',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF8B6F61),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import '../providers/favorite_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9F3),
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: const Color(0xFFFFF9F3),
        foregroundColor: const Color(0xFF633621),
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: Color(0xFF633621),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF633621).withValues(alpha: 0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFE2CF),
                      shape: BoxShape.circle,
                    ),
                    child: const CircleAvatar(
                      radius: 48,
                      backgroundColor: Color(0xFFFFE2CF),
                      backgroundImage: AssetImage(
                        'assets/images/kotlin_profile.jpg',
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Timothy John Reyes',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF633621),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Welcome to K3 Mini Delight!',
                    style: TextStyle(fontSize: 13, color: Color(0xFF8B6F61)),
                  ),
                  const SizedBox(height: 20),
                  Consumer2<CartProvider, FavoriteProvider>(
                    builder: (context, cartProvider, favoriteProvider, child) {
                      return Row(
                        children: [
                          Expanded(
                            child: _ProfileStat(
                              icon: Icons.favorite_rounded,
                              value: '${favoriteProvider.favorites.length}',
                              label: 'Favorites',
                            ),
                          ),
                          Expanded(
                            child: _ProfileStat(
                              icon: Icons.shopping_bag_rounded,
                              value: '${cartProvider.totalItems}',
                              label: 'Cart Items',
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const _ProfileMenuTile(
                    icon: Icons.person_outline_rounded,
                    title: 'Account Details',
                    subtitle: 'Timothy John Reyes',
                  ),
                  const Divider(height: 1, indent: 68),
                  const _ProfileMenuTile(
                    icon: Icons.email_outlined,
                    title: 'Email',
                    subtitle: 'timothyjohnreyes060303@gmail.com',
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

class _ProfileStat extends StatelessWidget {
  const _ProfileStat({
    required this.icon,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xFFB16A45), size: 20),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: Color(0xFF633621),
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 11, color: Color(0xFF8B6F61)),
        ),
      ],
    );
  }
}

class _ProfileMenuTile extends StatelessWidget {
  const _ProfileMenuTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      leading: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: const Color(0xFFFFE2CF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: const Color(0xFF633621), size: 21),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Color(0xFF633621),
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 12, color: Color(0xFF8B6F61)),
      ),
    );
  }
}

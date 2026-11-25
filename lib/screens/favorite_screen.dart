import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/app_colors.dart';
import '../providers/favorite_provider.dart';

import 'product_details_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'My Favorites',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: AppColors.primary,
          ),
        ),
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.primary,
        elevation: 0,

        actions: [
          IconButton(
            tooltip: 'Remove All Favorites',
            icon: const Icon(
              Icons.delete_sweep_rounded,
              color: AppColors.accent,
            ),
            onPressed: () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Remove All Favorites?'),
                  content: const Text(
                    'Are you sure you want to remove all favorite products?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('Remove All'),
                    ),
                  ],
                ),
              );

              if (confirm == true && context.mounted) {
                context.read<FavoriteProvider>().clearFavorites();
              }
            },
          ),
        ],
      ),
      body: Consumer<FavoriteProvider>(
        builder: (context, favoriteProvider, child) {
          if (favoriteProvider.favorites.isEmpty) {
            return const Center(
              child: Text(
                'No favorites yet.',
                style: TextStyle(fontSize: 14, color: AppColors.secondaryText),
              ),
            );
          }

          return ListView(
            children: favoriteProvider.favorites.map((product) {
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailsScreen(product: product),
                    ),
                  );
                },
                leading: Image.asset(
                  product.imagePath,
                  width: 55,
                  height: 55,
                  fit: BoxFit.cover,
                ),
                title: Text(product.name),
                subtitle: Text('₱${product.price.toStringAsFixed(2)}'),
                trailing: IconButton(
                  onPressed: () {
                    favoriteProvider.toggleFavorite(product);
                  },
                  icon: const Icon(
                    Icons.delete_outline_rounded,
                    color: AppColors.accent,
                  ),
                  tooltip: 'Remove from Favorites',
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

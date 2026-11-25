import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/app_colors.dart';
import '../providers/favorite_provider.dart';

import 'product_details_screen.dart';

import '../data/product_data.dart';
import '../providers/cart_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.onNavigateToMenu});

  final VoidCallback onNavigateToMenu;

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  void _addProductToCart(
    BuildContext context,
    String productId,
    String productName,
  ) {
    final product = products.firstWhere((product) => product.id == productId);
    context.read<CartProvider>().addToCart(product);

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('$productName added to cart'),
          duration: const Duration(seconds: 1),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width
        .clamp(0.0, 480.0)
        .toDouble();
    final textScale = MediaQuery.textScalerOf(context).scale(14) / 14;
    final bannerWidth = (screenWidth - 48).clamp(0.0, 432.0).toDouble();
    final compact = screenWidth < 360;
    final bannerHeight =
        (bannerWidth * 0.42 + (textScale - 1) * 70)
            .clamp(162.0, 300.0)
            .toDouble();
    final buttonHeight = (34 * textScale).clamp(34.0, 60.0).toDouble();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                children: [
              // Welcome card: greeting and brand message.
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 10, 24, 12),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.chipBackground,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: [
                      // Welcome message.
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Good Day, Sweetie!',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: AppColors.accent,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Sweet Cravings?',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: AppColors.primary,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              'Find your little happiness today!',
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.3,
                                color: AppColors.secondaryText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Favorite/brand accent icon.
                      Container(
                        width: 48,
                        height: 48,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.favorite_rounded,
                          color: AppColors.surface,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Hero banner: promotional image and offer message.
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: SizedBox(
                    width: double.infinity,
                      height: bannerHeight,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          'assets/images/hero-section.png',
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                        // Readability overlay.
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                AppColors.heroOverlayStrong,
                                AppColors.heroOverlayMedium,
                                AppColors.transparent,
                              ],
                              stops: [0.0, 0.58, 1.0],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(compact ? 16 : 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'SPECIAL OFFER',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 1.5,
                                  color: AppColors.chipBackground,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Sweet Deals for You!',
                                style: TextStyle(
                                  fontSize: compact ? 18 : 20,
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.surface,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Enjoy your favorite mini delights.',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.chipBackground,
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: buttonHeight,
                                child: ElevatedButton(
                                  onPressed: widget.onNavigateToMenu,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.background,
                                    foregroundColor: AppColors.primary,
                                    elevation: 0,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 14,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    'Order Now',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                                ],
                              ),
                            ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Best Sellers',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primary,
                      ),
                    ),

                    TextButton(
                      onPressed: widget.onNavigateToMenu,
                      child: const Text(
                        'See All',
                        style: TextStyle(
                          color: AppColors.accent,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _ProductCard(
                        productId: 'D001',
                        imagePath: 'assets/images/Mini Donut-Chocolate.jpg',
                        name: 'Chocolate Donut',
                        price: 35.00,
                        category: 'Donuts',
                        onAddToCart: () {
                          _addProductToCart(context, 'D001', 'Chocolate Donut');
                        },
                      ),
                      _ProductCard(
                        productId: 'W001',
                        imagePath: 'assets/images/Waffle-Chocolate.jpg',
                        name: 'Chocolate Waffle',
                        price: 85.00,
                        category: 'Waffles',
                        onAddToCart: () {
                          _addProductToCart(
                            context,
                            'W001',
                            'Chocolate Waffle',
                          );
                        },
                      ),

                      const SizedBox(width: 16),

                      _ProductCard(
                        productId: 'P001',
                        imagePath: 'assets/images/Pancake-Chocolate.jpg',
                        name: 'Chocolate Pancake',
                        price: 65.00,
                        category: 'Pancakes',
                        onAddToCart: () {
                          _addProductToCart(
                            context,
                            'P001',
                            'Chocolate Pancake',
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({
    required this.productId,
    required this.imagePath,
    required this.name,
    required this.price,
    required this.category,
    this.onAddToCart,
  });

  final String productId;
  final String imagePath;
  final String name;
  final double price;
  final String category;
  final VoidCallback? onAddToCart;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final product = products.firstWhere((item) => item.id == productId);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(product: product),
          ),
        );
      },

      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: SizedBox(
                width: double.infinity,
                height: 115,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(imagePath, fit: BoxFit.cover),

                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          color: AppColors.surface,
                          shape: BoxShape.circle,
                        ),
                        child: Consumer<FavoriteProvider>(
                          builder: (context, favoriteProvider, child) {
                            final product = products.firstWhere(
                              (item) => item.id == productId,
                            );

                            final isFavorite = favoriteProvider.isFavorite(
                              productId,
                            );

                            return IconButton(
                              onPressed: () {
                                favoriteProvider.toggleFavorite(product);
                              },
                              padding: EdgeInsets.zero,
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_border_rounded,
                                color: isFavorite
                                    ? AppColors.favorite
                                    : AppColors.secondaryText,
                                size: 19,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.2,
                      color: AppColors.accent,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '₱${price.toStringAsFixed(2)}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: Material(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(10),
                          child: IconButton(
                            onPressed: onAddToCart,
                            padding: EdgeInsets.zero,
                            tooltip: 'Add to cart',
                            icon: const Icon(
                              Icons.add_rounded,
                              color: AppColors.surface,
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                    ],
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

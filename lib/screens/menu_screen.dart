import '../data/product_data.dart';

import '../constants/app_colors.dart';

import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

import 'package:flutter/material.dart';

import '../models/product.dart';

import '../providers/favorite_provider.dart';

import 'product_details_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String _searchQuery = '';

  String _selectedCategory = 'All';

  List<Product> get _filteredProducts {
    return products.where((product) {
      final matchesSearch = product.name.toLowerCase().contains(
        _searchQuery.toLowerCase(),
      );

      final matchesCategory =
          _selectedCategory == 'All' || product.category == _selectedCategory;

      return matchesSearch && matchesCategory;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Our Menu',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: AppColors.primary,
                  ),
                ),

                const SizedBox(height: 4),

                const Text(
                  'Find your favorite sweet treats!',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.secondaryText,
                  ),
                ),

                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Container(
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.07),
                          blurRadius: 16,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Search icon.
                        const Icon(
                          Icons.search_rounded,
                          color: AppColors.secondaryText,
                          size: 22,
                        ),

                        const SizedBox(width: 12),

                        // Search input.
                        Expanded(
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                _searchQuery = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'Search your favorite treats...',
                              hintStyle: const TextStyle(
                                color: AppColors.hintText,
                                fontSize: 14,
                              ),
                              border: InputBorder.none,
                              isCollapsed: true,
                            ),
                          ),
                        ),

                        // Filter icon.
                        const Icon(
                          Icons.tune_rounded,
                          color: AppColors.accent,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _CategoryButton(
                        label: 'All',
                        isSelected: _selectedCategory == 'All',
                        onTap: () {
                          setState(() {
                            _selectedCategory = 'All';
                          });
                        },
                      ),
                      _CategoryButton(
                        label: 'Donuts',
                        isSelected: _selectedCategory == 'Donuts',
                        onTap: () {
                          setState(() {
                            _selectedCategory = 'Donuts';
                          });
                        },
                      ),
                      _CategoryButton(
                        label: 'Waffles',
                        isSelected: _selectedCategory == 'Waffles',
                        onTap: () {
                          setState(() {
                            _selectedCategory = 'Waffles';
                          });
                        },
                      ),
                      _CategoryButton(
                        label: 'Pancakes',
                        isSelected: _selectedCategory == 'Pancakes',
                        onTap: () {
                          setState(() {
                            _selectedCategory = 'Pancakes';
                          });
                        },
                      ),
                      _CategoryButton(
                        label: 'Sodas',
                        isSelected: _selectedCategory == 'Sodas',
                        onTap: () {
                          setState(() {
                            _selectedCategory = 'Sodas';
                          });
                        },
                      ),
                      _CategoryButton(
                        label: 'Floats',
                        isSelected: _selectedCategory == 'Floats',
                        onTap: () {
                          setState(() {
                            _selectedCategory = 'Floats';
                          });
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      const crossAxisCount = 2;
                      const crossAxisSpacing = 14.0;
                      final cardWidth =
                          (constraints.maxWidth - crossAxisSpacing) /
                          crossAxisCount;
                      final textScale =
                          MediaQuery.textScalerOf(context).scale(14) / 14;
                      final imageHeight = cardWidth * 0.74;
                      final detailsHeight = 128 * textScale;
                      final cardAspectRatio =
                          cardWidth / (imageHeight + detailsHeight);

                      return GridView.builder(
                        itemCount: _filteredProducts.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: crossAxisSpacing,
                          mainAxisSpacing: 16,
                          childAspectRatio: cardAspectRatio,
                        ),
                        itemBuilder: (context, index) {
                          final product = _filteredProducts[index];

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDetailsScreen(product: product),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.surface,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primary.withValues(
                                      alpha: 0.08,
                                    ),
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
                                      height: imageHeight,
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          Image.asset(
                                            product.imagePath,
                                            fit: BoxFit.cover,
                                          ),
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
                                                builder:
                                                    (
                                                      context,
                                                      favoriteProvider,
                                                      child,
                                                    ) {
                                                      final isFavorite =
                                                          favoriteProvider
                                                              .isFavorite(
                                                                product.id,
                                                              );

                                                      return IconButton(
                                                        onPressed: () {
                                                          favoriteProvider
                                                              .toggleFavorite(
                                                                product,
                                                              );
                                                        },
                                                        padding:
                                                            EdgeInsets.zero,
                                                        icon: Icon(
                                                          isFavorite
                                                              ? Icons
                                                                    .favorite_rounded
                                                              : Icons
                                                                    .favorite_border_rounded,
                                                          color: isFavorite
                                                              ? AppColors
                                                                    .favorite
                                                              : AppColors
                                                                    .secondaryText,
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
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            product.category.toUpperCase(),
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
                                            product.name,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                          const Spacer(),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  '₱${product.price.toStringAsFixed(2)}',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: IconButton(
                                                    onPressed: () {
                                                      context
                                                          .read<CartProvider>()
                                                          .addToCart(product);

                                                      ScaffoldMessenger.of(
                                                          context,
                                                        )
                                                        ..hideCurrentSnackBar()
                                                        ..showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              '${product.name} added to cart',
                                                            ),
                                                            duration:
                                                                const Duration(
                                                                  seconds: 1,
                                                                ),
                                                          ),
                                                        );
                                                    },
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
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({
    required this.label,
    required this.onTap,
    required this.isSelected,
  });

  final String label;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.chipBackground,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: isSelected ? AppColors.surface : AppColors.primary,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'cart_screen.dart';
import 'menu_screen.dart';
import 'package:provider/provider.dart';
import '../data/product_data.dart';
import '../providers/cart_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
    final product = products.firstWhere(
      (product) => product.id == productId,
    );
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
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9F3),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            children: [
              // Header: brand name and quick action icons.
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Brand section.
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'K3',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF633621),
                            letterSpacing: 2,
                          ),
                        ),

                        const Text(
                          'MINI DELIGHT',
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF8B5E48),
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),

                    // Header action buttons.
                    Container(
                      width: 42,
                      height: 42,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CartScreen(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.shopping_bag_outlined,
                          size: 22,
                          color: Color(0xFF633621),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

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
                    color: const Color(0xFFFFE2CF),
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
                                color: Color(0xFFB16A45),
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Sweet Cravings?',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF633621),
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              'Find your little happiness today!',
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.3,
                                color: Color(0xFF8B6F61),
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
                          color: Color(0xFF633621),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.favorite_rounded,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Search field: allows users to look for treats.
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF633621).withValues(alpha: 0.07),
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
                        color: Color(0xFF8B6F61),
                        size: 22,
                      ),

                      const SizedBox(width: 12),

                      // Search input.
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search your favorite treats...',
                            hintStyle: const TextStyle(
                              color: Color(0xFFA18B7D),
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
                        color: Color(0xFFB16A45),
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Hero banner: promotional image and offer message.
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: SizedBox(
                    width: double.infinity,
                    height: 162,
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
                                Color(0xE6633621),
                                Color(0xA6633621),
                                Color(0x00000000),
                              ],
                              stops: [0.0, 0.58, 1.0],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
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
                                  color: Color(0xFFFFE2CF),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Sweet Deals for You!',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Enjoy your favorite mini delights.',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFFFFE2CF),
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 34,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const MenuScreen(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFFFF9F3),
                                    foregroundColor: const Color(0xFF633621),
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
                        color: Color(0xFF633621),
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MenuScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'See All',
                        style: TextStyle(
                          color: Color(0xFFB16A45),
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
                        imagePath: 'assets/images/Mini Donut-Chocolate.jpg',
                        name: 'Chocolate Donut',
                        price: 35.00,
                        category: 'Donuts',
                        onAddToCart: () {
                          _addProductToCart(
                            context,
                            'D001',
                            'Chocolate Donut',
                          );
                        },
                      ),

                      const SizedBox(width: 16),

                      _ProductCard(
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

      // Bottom navigation: main app destinations.
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF633621),
        unselectedItemColor: const Color(0xFFA18B7D),
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu_outlined),
            activeIcon: Icon(Icons.restaurant_menu_rounded),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_rounded),
            activeIcon: Icon(Icons.favorite_border_rounded),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            activeIcon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({
    required this.imagePath,
    required this.name,
    required this.price,
    required this.category,
    this.onAddToCart,
  });

  final String imagePath;
  final String name;
  final double price;
  final String category;
  final VoidCallback? onAddToCart;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
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
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
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
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.favorite_border_rounded,
                        color: Color(0xFF8B6F61),
                        size: 19,
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
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2,
                    color: Color(0xFFB16A45),
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF633621),
                  ),
                ),

                const SizedBox(height: 6),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '₱${price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF633621),
                      ),
                    ),

                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Material(
                        color: const Color(0xFF633621),
                        borderRadius: BorderRadius.circular(10),
                        child: IconButton(
                          onPressed: onAddToCart,
                          padding: EdgeInsets.zero,
                          tooltip: 'Add to cart',
                          icon: const Icon(
                            Icons.add_rounded,
                            color: Colors.white,
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
    );
  }
}

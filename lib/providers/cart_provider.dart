import 'package:flutter/foundation.dart';

import '../models/product.dart';
import '../data/product_data.dart';

class CartProvider extends ChangeNotifier {
  final Map<String, int> _items = {};

  Map<String, int> get items => Map.unmodifiable(_items);

  int get totalItems {
    return _items.values.fold(0, (total, quantity) => total + quantity);
  }

  double get totalAmount {
    return _items.entries.fold(0.0, (total, entry) {
      final product = _findProduct(entry.key);
      return total + (product.price * entry.value);
    });
  }

  void addToCart(Product product) {
    _items.update(product.id, (quantity) => quantity + 1, ifAbsent: () => 1);

    notifyListeners();
  }

  void removeFromCart(Product product) {
    if (!_items.containsKey(product.id)) return;

    if (_items[product.id]! > 1) {
      _items[product.id] = _items[product.id]! - 1;
    } else {
      _items.remove(product.id);
    }

    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  Product _findProduct(String productId) {
    return products.firstWhere((product) => product.id == productId);
  }
}

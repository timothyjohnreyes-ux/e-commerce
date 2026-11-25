import 'package:flutter/foundation.dart';

import '../models/product.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Product> _favorites = [];

  List<Product> get favorites => List.unmodifiable(_favorites);

  void toggleFavorite(Product product) {
    if (_favorites.any((item) => item.id == product.id)) {
      _favorites.removeWhere((item) => item.id == product.id);
    } else {
      _favorites.add(product);
    }

    notifyListeners();
  }

  bool isFavorite(String productId) {
    return _favorites.any((product) => product.id == productId);
  }

  void clearFavorites() {
    _favorites.clear();
    notifyListeners();
  }
}

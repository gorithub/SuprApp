import 'package:flutter/material.dart';

class QuantityProvider with ChangeNotifier {
  final Map<String, int> _quantities = {};

  int getQuantity(String productId) => _quantities[productId] ?? 0;

  void increase(String productId) {
    _quantities[productId] = getQuantity(productId) + 1;
    notifyListeners();
  }

  void decrease(String productId) {
    final current = getQuantity(productId);
    if (current > 1) {
      _quantities[productId] = current - 1;
    } else {
      _quantities.remove(productId);
    }
    notifyListeners();
  }

  void remove(String productId) {
    _quantities.remove(productId);
    notifyListeners();
  }

  int get totalQuantity => _quantities.values.fold(0, (sum, quantity) => sum + quantity);
}

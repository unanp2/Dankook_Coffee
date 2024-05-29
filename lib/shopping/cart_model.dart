import 'package:flutter/foundation.dart';
import '../menu/menu_model.dart';

class CartItem {
  final Menu menu;
  int quantity;

  CartItem({required this.menu, this.quantity = 1});
}

class Cart with ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double get totalAmount {
    return _items.fold(0.0, (sum, item) => sum + (item.menu.menuCost * item.quantity));
  }

  void addItem(Menu menu, int quantity) {
    final index = _items.indexWhere((item) => item.menu.menuId == menu.menuId);
    if (index >= 0) {
      _items[index].quantity += quantity;
    } else {
      _items.add(CartItem(menu: menu, quantity: quantity));
    }
    notifyListeners();
  }

  void removeItem(Menu menu) {
    _items.removeWhere((item) => item.menu.menuId == menu.menuId);
    notifyListeners();
  }

  void incrementItem(Menu menu) {
    final index = _items.indexWhere((item) => item.menu.menuId == menu.menuId);
    if (index >= 0) {
      _items[index].quantity++;
      notifyListeners();
    }
  }

  void decrementItem(Menu menu) {
    final index = _items.indexWhere((item) => item.menu.menuId == menu.menuId);
    if (index >= 0) {
      _items[index].quantity--;
      if (_items[index].quantity == 0) {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }
}

import 'package:flutter/material.dart';
import '../database/DatabaseHelper.dart';
import 'shopping_item.dart';

class Cart with ChangeNotifier {
  List<ShoppingItem> _items = [];
  int _totalAmount = 0;
  late DatabaseHelper _dbHelper;

  Cart(this._dbHelper) {
    loadCartItems();
  }

  List<ShoppingItem> get items => _items;

  int get totalAmount => _totalAmount;

  Future<void> loadCartItems() async {
    _items = await _dbHelper.fetchShoppingItems();
    _totalAmount = await _dbHelper.getTotalAmount();
    notifyListeners();
  }

  Future<void> addItem(ShoppingItem item) async {
    // 기존 항목이 있는지 확인
    final existingItemIndex = _items.indexWhere((element) => element.menuId == item.menuId && element.storeId == item.storeId);

    if (existingItemIndex >= 0) {
      // 기존 항목이 있으면 수량 증가
      final existingItem = _items[existingItemIndex];
      final updatedItem = existingItem.copyWith(
        menuQuantity: existingItem.menuQuantity + item.menuQuantity,
        menuAllCost: existingItem.menuCost * (existingItem.menuQuantity + item.menuQuantity),
      );
      await _dbHelper.updateShoppingItem(updatedItem);
    } else {
      // 새로운 항목이면 추가
      await _dbHelper.insertShoppingItem(item);
    }

    await loadCartItems();
  }

  Future<void> incrementItem(ShoppingItem item) async {
    final updatedItem = item.copyWith(
      menuQuantity: item.menuQuantity + 1,
      menuAllCost: item.menuCost * (item.menuQuantity + 1),
    );
    await _dbHelper.updateShoppingItem(updatedItem);
    await loadCartItems();
  }

  Future<void> decrementItem(ShoppingItem item) async {
    if (item.menuQuantity > 1) {
      final updatedItem = item.copyWith(
        menuQuantity: item.menuQuantity - 1,
        menuAllCost: item.menuCost * (item.menuQuantity - 1),
      );
      await _dbHelper.updateShoppingItem(updatedItem);
    } else {
      await _dbHelper.deleteShoppingItem(item.menuId, item.storeId);
    }
    await loadCartItems();
  }

  Future<void> removeItem(ShoppingItem item) async {
    await _dbHelper.deleteShoppingItem(item.menuId, item.storeId);
    await loadCartItems();
  }
}

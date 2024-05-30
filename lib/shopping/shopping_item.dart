class ShoppingItem {
  final int menuId;
  final int storeId;
  final String menuPictureUrl;
  final String menuName;
  final int menuCost;
  final int menuQuantity;
  final int menuAllCost;
  final String menuEat;

  ShoppingItem({
    required this.menuId,
    required this.storeId,
    required this.menuPictureUrl,
    required this.menuName,
    required this.menuCost,
    required this.menuQuantity,
    required this.menuAllCost,
    required this.menuEat,
  });

  factory ShoppingItem.fromJson(Map<String, dynamic> json) {
    return ShoppingItem(
      menuId: json['menu_id'],
      storeId: json['store_id'],
      menuPictureUrl: json['menu_picture_url'],
      menuName: json['menu_name'],
      menuCost: json['menu_cost'],
      menuQuantity: json['menu_quantity'],
      menuAllCost: json['menu_all_cost'],
      menuEat: json['menu_eat'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'menu_id': menuId,
      'store_id': storeId,
      'menu_picture_url': menuPictureUrl,
      'menu_name': menuName,
      'menu_cost': menuCost,
      'menu_quantity': menuQuantity,
      'menu_all_cost': menuAllCost,
      'menu_eat': menuEat,
    };
  }

  ShoppingItem copyWith({
    int? menuQuantity,
    int? menuAllCost,
  }) {
    return ShoppingItem(
      menuId: menuId,
      storeId: storeId,
      menuPictureUrl: menuPictureUrl,
      menuName: menuName,
      menuCost: menuCost,
      menuQuantity: menuQuantity ?? this.menuQuantity,
      menuAllCost: menuAllCost ?? this.menuAllCost,
      menuEat: menuEat,
    );
  }
}

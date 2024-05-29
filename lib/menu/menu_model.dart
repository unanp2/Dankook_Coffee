class Menu {
  final int menuId;
  final int storeId;
  final String menuPictureUrl;
  final String menuName;
  final double menuRatingAverage;
  final int menuCategoryId;
  final String menuInfo;
  final int menuCost;
  final int menuReviewCount;
  final int menuFavorites;

  Menu({
    required this.menuId,
    required this.storeId,
    required this.menuPictureUrl,
    required this.menuName,
    required this.menuRatingAverage,
    required this.menuCategoryId,
    required this.menuInfo,
    required this.menuCost,
    required this.menuReviewCount,
    required this.menuFavorites,
  });

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      menuId: json['menu_id'] ?? 0,
      storeId: json['store_id'] ?? 0,
      menuPictureUrl: json['menu_picture_url'] ?? '',
      menuName: json['menu_name'] ?? '',
      menuRatingAverage: (json['menu_rating_average'] ?? 0).toDouble(),
      menuCategoryId: json['menu_category_id'] ?? 0,
      menuInfo: json['menu_info'] ?? '',
      menuCost: json['menu_cost'] ?? 0,
      menuReviewCount: json['menu_review_count'] ?? 0,
      menuFavorites: json['menu_favorites'] ?? 0,
    );
  }
}

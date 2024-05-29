import 'package:flutter/material.dart';
import 'menu_service.dart';
import 'menu_model.dart';
import 'menu_detail.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late Future<List<Menu>> futureMenu;
  int selectedCategoryId = 1; // Default category ID

  @override
  void initState() {
    super.initState();
    futureMenu = MenuService().fetchMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DANKOOK COFFEE'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            CategorySelector(
              onCategorySelected: (id) {
                setState(() {
                  selectedCategoryId = id;
                });
              },
            ),
            Expanded(
              child: FutureBuilder<List<Menu>>(
                future: futureMenu,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    final menus = snapshot.data!
                        .where((menu) => menu.menuCategoryId == selectedCategoryId)
                        .toList();
                    return GridView.builder(
                      padding: const EdgeInsets.all(10),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: menus.length,
                      itemBuilder: (context, index) {
                        final menu = menus[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MenuDetailPage(menu: menu),
                              ),
                            );
                          },
                          child: MenuItem(menu: menu),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategorySelector extends StatelessWidget {
  final Function(int) onCategorySelected;

  const CategorySelector({required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CategoryButton(
              categoryId: 1,
              categoryName: '추천',
              icon: Icons.star,
              onCategorySelected: onCategorySelected),
          CategoryButton(
              categoryId: 2,
              categoryName: '푸드',
              icon: Icons.fastfood,
              onCategorySelected: onCategorySelected),
          CategoryButton(
              categoryId: 3,
              categoryName: '음료',
              icon: Icons.local_drink,
              onCategorySelected: onCategorySelected),
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final int categoryId;
  final String categoryName;
  final IconData icon;
  final Function(int) onCategorySelected;

  const CategoryButton(
      {required this.categoryId,
        required this.categoryName,
        required this.icon,
        required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onCategorySelected(categoryId),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24, color: Colors.black),
          const SizedBox(height: 4),
          Text(categoryName, style: const TextStyle(fontSize: 18, color: Colors.black)),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final Menu menu;

  const MenuItem({required this.menu});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(
                  menu.menuPictureUrl,
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    // Handle add to cart action
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  menu.menuName,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  '${menu.menuCost} 원',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

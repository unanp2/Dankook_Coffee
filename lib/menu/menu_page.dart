import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../menu/menu_service.dart';
import '../menu/menu_model.dart';
import 'menu_detail.dart';
import '../shopping/cart_model.dart';
import '../shopping/cart_page.dart';
import '../shopping/shopping_item.dart';
import '../database/DatabaseHelper.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> with SingleTickerProviderStateMixin {
  late Future<List<Menu>> futureMenu;
  List<Menu> filteredMenu = [];
  String searchQuery = '';
  int selectedCategoryId = 0;
  late TabController _tabController;
  late MenuService menuService;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        selectedCategoryId = _tabController.index;
      });
      filterMenu();
    });

    menuService = MenuService(Provider.of<DatabaseHelper>(context, listen: false));
    futureMenu = menuService.fetchMenu();
    futureMenu.then((menu) {
      setState(() {
        filteredMenu = menu;
      });
    });
  }

  void filterMenu() {
    futureMenu.then((menuList) {
      setState(() {
        filteredMenu = menuList.where((menu) {
          return (selectedCategoryId == 0 || menu.menuCategoryId == selectedCategoryId) &&
              menu.menuName.toLowerCase().contains(searchQuery.toLowerCase());
        }).toList();
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DANKOOK COFFEE'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, CartPage.routeName);
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  '죽전단국대점',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TabBar(
                controller: _tabController,
                tabs: [
                  Tab(icon: Icon(Icons.list, color: Colors.black), text: '전체'),
                  Tab(icon: Icon(Icons.star, color: Colors.black), text: '추천'),
                  Tab(icon: Icon(Icons.local_drink, color: Colors.black), text: '음료'),
                  Tab(icon: Icon(Icons.fastfood, color: Colors.black), text: '푸드'),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: '검색',
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                  filterMenu();
                },
              ),
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
                    final menus = filteredMenu.where((menu) => selectedCategoryId == 0 || menu.menuCategoryId == selectedCategoryId).toList();
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
                child: CachedNetworkImage(
                  imageUrl: menu.menuPictureUrl,
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Image.asset(
                    'assets/images/placeholder.png',
                    width: double.infinity,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    final cartItem = ShoppingItem(
                      menuId: menu.menuId,
                      storeId: menu.storeId,
                      menuPictureUrl: menu.menuPictureUrl,
                      menuName: menu.menuName,
                      menuCost: menu.menuCost,
                      menuQuantity: 1,
                      menuAllCost: menu.menuCost,
                      menuEat: 'yes',
                    );

                    Provider.of<Cart>(context, listen: false).addItem(cartItem);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${menu.menuName} 가 장바구니에 추가되었습니다.'),
                        duration: Duration(seconds: 1),
                      ),
                    );
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
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

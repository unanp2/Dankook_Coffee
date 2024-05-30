import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'menu_service.dart';
import 'menu_model.dart';
import 'menu_detail.dart';
import '../shopping/cart_model.dart';
import '../shopping/cart_page.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> with SingleTickerProviderStateMixin {
  late Future<List<Menu>> futureMenu; // 메뉴 데이터를 불러오기 위한 Future 객체
  List<Menu> filteredMenu = []; // 필터링된 메뉴 리스트
  String searchQuery = ''; // 검색어
  int selectedCategoryId = 0; // 선택된 카테고리 ID
  late TabController _tabController; // TabBar 컨트롤러

  @override
  void initState() {
    super.initState();
    // TabController 초기화, 4개의 탭
    _tabController = TabController(length: 4, vsync: this);
    // 탭 변경 시 카테고리 ID와 필터링된 메뉴 업데이트
    _tabController.addListener(() {
      setState(() {
        selectedCategoryId = _tabController.index;
      });
      filterMenu();
    });

    // 메뉴 데이터 불러오기
    futureMenu = MenuService().fetchMenu();
    futureMenu.then((menu) {
      setState(() {
        filteredMenu = menu;
      });
    });
  }

  // 메뉴 필터링 함수
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
    // TabController 해제
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
              Navigator.pushNamed(context, '/'); // 홈 화면으로 이동
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, CartPage.routeName); // 장바구니 화면으로 이동
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: Column(
            children: [
              // 매장명 표시
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
              // TabBar 추가
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
            // 검색창
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
                  filterMenu(); // 검색어 변경 시 메뉴 필터링
                },
              ),
            ),
            // 필터링된 메뉴 표시
            Expanded(
              child: FutureBuilder<List<Menu>>(
                future: futureMenu,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator()); // 로딩 중 표시
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}')); // 에러 메시지 표시
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
                                builder: (context) => MenuDetailPage(menu: menu), // 메뉴 상세 페이지로 이동
                              ),
                            );
                          },
                          child: MenuItem(menu: menu), // 메뉴 아이템 위젯
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
              // 메뉴 이미지
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
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()), // 로딩 중 표시
                  errorWidget: (context, url, error) => Image.asset(
                    'assets/images/placeholder.png',
                    width: double.infinity,
                    height: 120,
                    fit: BoxFit.cover,
                  ), // 에러 시 기본 이미지 표시
                ),
              ),
              // 장바구니 아이콘
              Positioned(
                bottom: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    Provider.of<Cart>(context, listen: false).addItem(menu, 1); // 장바구니에 메뉴 추가
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
          // 메뉴 이름과 가격 표시
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

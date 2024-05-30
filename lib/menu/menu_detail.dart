import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../shopping/cart_model.dart';
import '../shopping/shopping_item.dart';
import '../shopping/cart_page.dart';
import 'menu_model.dart';

class MenuDetailPage extends StatefulWidget {
  final Menu menu;

  const MenuDetailPage({required this.menu});

  @override
  _MenuDetailPageState createState() => _MenuDetailPageState();
}

class _MenuDetailPageState extends State<MenuDetailPage> {
  int quantity = 1;
  bool isFavorite = false;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);

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
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: [
              DetailContent(
                menu: widget.menu,
                quantity: quantity,
                incrementQuantity: incrementQuantity,
                decrementQuantity: decrementQuantity,
                isFavorite: isFavorite,
                toggleFavorite: toggleFavorite,
                onAddToCart: () {
                  final cartItem = ShoppingItem(
                    menuId: widget.menu.menuId,
                    storeId: widget.menu.storeId,
                    menuPictureUrl: widget.menu.menuPictureUrl,
                    menuName: widget.menu.menuName,
                    menuCost: widget.menu.menuCost,
                    menuQuantity: quantity,
                    menuAllCost: widget.menu.menuCost * quantity,
                    menuEat: 'yes',
                  );

                  cart.addItem(cartItem);
                  Navigator.pushNamed(context, CartPage.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailContent extends StatelessWidget {
  final Menu menu;
  final int quantity;
  final VoidCallback incrementQuantity;
  final VoidCallback decrementQuantity;
  final bool isFavorite;
  final VoidCallback toggleFavorite;
  final VoidCallback onAddToCart;

  const DetailContent({
    required this.menu,
    required this.quantity,
    required this.incrementQuantity,
    required this.decrementQuantity,
    required this.isFavorite,
    required this.toggleFavorite,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 455,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F0F0),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(menu.menuPictureUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.red,
                        ),
                        onPressed: toggleFavorite,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  menu.menuName,
                  style: const TextStyle(
                    color: Color(0xFF303030),
                    fontSize: 24,
                    fontFamily: 'Gelasio',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${menu.menuCost} 원',
                  style: const TextStyle(
                    color: Color(0xFF303030),
                    fontSize: 30,
                    fontFamily: 'Nunito Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    Text(
                      menu.menuRatingAverage.toString(),
                      style: const TextStyle(
                        color: Color(0xFF303030),
                        fontSize: 18,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '(50 reviews)',
                      style: TextStyle(
                        color: Color(0xFF808080),
                        fontSize: 14,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: decrementQuantity,
                      icon: const Icon(Icons.remove),
                    ),
                    Text(
                      quantity.toString().padLeft(2, '0'),
                      style: const TextStyle(
                        color: Color(0xFF232323),
                        fontSize: 18,
                        fontFamily: 'Nunito Sans',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.90,
                      ),
                    ),
                    IconButton(
                      onPressed: incrementQuantity,
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  menu.menuInfo,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    color: Color(0xFF5F5F5F),
                    fontSize: 14,
                    fontFamily: 'Gowun Dodum',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: onAddToCart,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF232323),
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Add to cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Nunito Sans',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'home_page.dart';
import 'store/store_info.dart';
import 'menu/menu_page.dart';
import 'shopping/cart_page.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/store-info': (context) => StoreInfoPage(),
        '/menu': (context) => MenuPage(),
        '/cart': (context) => CartPage(),
      },
    );
  }
}

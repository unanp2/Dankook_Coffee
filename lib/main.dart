import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'store/store_info.dart';
import 'menu/menu_page.dart';
import 'shopping/cart_model.dart';
import 'shopping/cart_page.dart';
import 'review/review_store.dart';
import 'review/review_store_empty.dart';
import 'review/review_write.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Cart()),
      ],
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/store-info': (context) => StoreInfoPage(),
          '/menu': (context) => MenuPage(),
          '/cart': (context) => CartPage(),
          '/review': (context) => ReviewListPage(),
        },
      ),
    );
  }
}

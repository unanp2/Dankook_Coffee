import 'package:dankookcoffee/store/store_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'menu/menu_page.dart';
import 'shopping/cart_page.dart';
import 'database/DatabaseHelper.dart';
import 'shopping/cart_model.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final DatabaseHelper dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Cart>(
          create: (_) => Cart(dbHelper),
        ),
        Provider<DatabaseHelper>(
          create: (_) => dbHelper,
        ),
      ],
      child: MaterialApp(
        title: 'Dankook Coffee',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/store': (context) => StoreInfoPage(),
          '/menu': (context) => MenuPage(),
          CartPage.routeName: (context) => CartPage(),
          // 다른 페이지들도 여기에 추가
        },
      ),
    );
  }
}

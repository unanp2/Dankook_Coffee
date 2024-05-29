import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'menu_model.dart';

class MenuService {
  Future<List<Menu>> fetchMenu() async {
    final String response = await rootBundle.loadString('assets/menucsvjson.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => Menu.fromJson(json)).toList();
  }
}

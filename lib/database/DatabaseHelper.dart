import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import '../shopping/shopping_item.dart';
import '../menu/menu_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'menu_store.db');

    // 기존 데이터베이스 삭제
    await deleteDatabase(path);

    // 새로운 데이터베이스 생성
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await _createTables(db);
        await _insertInitialData(db);
      },
    );
  }

  Future<void> _createTables(Database db) async {
    await db.execute('''
      CREATE TABLE user (
        user_id INTEGER PRIMARY KEY,
        profile_picture_url TEXT,
        login_id TEXT NOT NULL,
        password TEXT NOT NULL,
        nickname TEXT NOT NULL,
        email TEXT NOT NULL,
        ranked TEXT,
        coupon INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE store (
        store_id INTEGER PRIMARY KEY,
        store_picture_url TEXT,
        store_name TEXT NOT NULL,
        store_address TEXT NOT NULL,
        store_phone_number TEXT NOT NULL,
        latitude REAL NOT NULL,
        longitude REAL NOT NULL,
        rating_average REAL NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE review (
        review_id INTEGER PRIMARY KEY,
        user_id INTEGER NOT NULL,
        store_id INTEGER NOT NULL,
        store_picture_url TEXT NOT NULL,
        rating INTEGER NOT NULL,
        content TEXT,
        created_date TIMESTAMP NOT NULL,
        modified_date TIMESTAMP NOT NULL,
        FOREIGN KEY(user_id) REFERENCES user(user_id),
        FOREIGN KEY(store_id) REFERENCES store(store_id)
      )
    ''');

    await db.execute('''
      CREATE TABLE menu (
        menu_id INTEGER NOT NULL,
        store_id INTEGER NOT NULL,
        menu_picture_url TEXT,
        menu_name TEXT,
        menu_rating_average REAL NOT NULL,
        menu_category_id INTEGER NOT NULL,
        menu_info TEXT,
        menu_cost INTEGER,
        menu_review_count INTEGER,
        menu_favorites INTEGER,
        PRIMARY KEY(menu_id, store_id),
        FOREIGN KEY(store_id) REFERENCES store(store_id)
      )
    ''');

    await db.execute('''
      CREATE TABLE shopping (
        menu_id INTEGER NOT NULL,
        store_id INTEGER NOT NULL,
        menu_picture_url TEXT,
        menu_name TEXT,
        menu_cost INTEGER,
        menu_quantity INTEGER,
        menu_all_cost INTEGER,
        menu_eat TEXT,
        PRIMARY KEY(menu_id, store_id),
        FOREIGN KEY(menu_id) REFERENCES menu(menu_id),
        FOREIGN KEY(store_id) REFERENCES menu(store_id)
      )
    ''');

    await db.execute('''
      CREATE TABLE CopyOfreview (
        review_id INTEGER NOT NULL,
        store_id INTEGER NOT NULL,
        menu_id INTEGER NOT NULL,
        user_id INTEGER NOT NULL,
        menu_picture_url TEXT NOT NULL,
        menu_name TEXT NOT NULL,
        rating INTEGER NOT NULL,
        content TEXT,
        created_date TIMESTAMP NOT NULL,
        modified_date TIMESTAMP NOT NULL,
        PRIMARY KEY(review_id, store_id, menu_id),
        FOREIGN KEY(store_id) REFERENCES store(store_id),
        FOREIGN KEY(menu_id) REFERENCES menu(menu_id),
        FOREIGN KEY(user_id) REFERENCES user(user_id)
      )
    ''');
  }

  Future<void> _insertInitialData(Database db) async {
    final storeJson = await rootBundle.loadString('assets/store_csvjson.json');
    final menuJson = await rootBundle.loadString('assets/menu_csvjson.json');

    final List<dynamic> storeData = json.decode(storeJson);
    final List<dynamic> menuData = json.decode(menuJson);

    for (var store in storeData) {
      await db.insert('store', store, conflictAlgorithm: ConflictAlgorithm.replace);
    }

    for (var menu in menuData) {
      await db.insert('menu', menu, conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  Future<void> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    await db.insert('user', user, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Menu>> fetchMenus() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('menu');
    return List.generate(maps.length, (i) {
      return Menu.fromJson(maps[i]);
    });
  }

  Future<List<ShoppingItem>> fetchShoppingItems() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.rawQuery('''
      SELECT s.*, m.menu_name, m.menu_picture_url 
      FROM shopping s
      JOIN menu m ON s.menu_id = m.menu_id AND s.store_id = m.store_id
    ''');
    return List.generate(maps.length, (i) {
      return ShoppingItem.fromJson(maps[i]);
    });
  }

  Future<void> insertShoppingItem(ShoppingItem item) async {
    final db = await database;
    await db.insert('shopping', item.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> updateShoppingItem(ShoppingItem item) async {
    final db = await database;
    await db.update('shopping', item.toJson(), where: 'menu_id = ? AND store_id = ?', whereArgs: [item.menuId, item.storeId]);
  }

  Future<void> deleteShoppingItem(int menuId, int storeId) async {
    final db = await database;
    await db.delete('shopping', where: 'menu_id = ? AND store_id = ?', whereArgs: [menuId, storeId]);
  }

  Future<int> getTotalAmount() async {
    final db = await database;
    final result = await db.rawQuery('SELECT SUM(menu_cost * menu_quantity) as total FROM shopping');
    var total = result.first['total'];
    if (total == null) {
      return 0;
    } else if (total is int) {
      return total;
    } else if (total is double) {
      return total.toInt();
    } else {
      throw Exception('Unexpected value type for total: ${total.runtimeType}');
    }
  }

  Future<bool> userExists(String username, String email) async {
    final db = await database;
    final result = await db.query(
      'user',
      where: 'login_id = ? OR email = ?',
      whereArgs: [username, email],
    );
    return result.isNotEmpty;
  }
}

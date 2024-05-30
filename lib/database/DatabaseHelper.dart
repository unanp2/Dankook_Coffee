import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import '../lib/menu/menu_model.dart';
import '../lib/store/store_model.dart';

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
      CREATE TABLE menu (
        menu_id INTEGER,
        store_id INTEGER,
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
      CREATE TABLE review (
        review_id INTEGER PRIMARY KEY,
        user_id INTEGER NOT NULL,
        store_id INTEGER NOT NULL,
        rating INTEGER NOT NULL,
        content TEXT,
        created_date TIMESTAMP NOT NULL,
        modified_date TIMESTAMP NOT NULL,
        FOREIGN KEY(user_id) REFERENCES user(user_id),
        FOREIGN KEY(store_id) REFERENCES store(store_id)
      )
    ''');

    await db.execute('''
      CREATE TABLE shopping (
        menu_id INTEGER,
        store_id INTEGER,
        menu_picture_url TEXT,
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
      CREATE TABLE copy_of_review (
        review_id INTEGER,
        store_id INTEGER,
        menu_id INTEGER,
        user_id INTEGER,
        rating INTEGER NOT NULL,
        content TEXT,
        created_date TIMESTAMP NOT NULL,
        modified_date TIMESTAMP NOT NULL,
        PRIMARY KEY(review_id, store_id, menu_id),
        FOREIGN KEY(store_id) REFERENCES menu(store_id),
        FOREIGN KEY(menu_id) REFERENCES menu(menu_id),
        FOREIGN KEY(user_id) REFERENCES user(user_id)
      )
    ''');
  }

  Future<void> _insertInitialData(Database db) async {
    // JSON 파일에서 데이터를 불러와서 삽입합니다.
    // 이 예제에서는 JSON 파일이 로컬 파일 시스템에 저장되어 있다고 가정합니다.
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

  Future<List<Menu>> fetchMenus() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('menu');
    return List.generate(maps.length, (i) {
      return Menu.fromJson(maps[i]);
    });
  }

  Future<List<Store>> fetchStores() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('store');
    return List.generate(maps.length, (i) {
      return Store.fromJson(maps[i]);
    });
  }
}

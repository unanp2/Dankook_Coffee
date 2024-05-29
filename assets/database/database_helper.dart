import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart' show rootBundle;

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('app_database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE user (
        user_id INTEGER PRIMARY KEY,
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
        rating INTEGER NOT NULL,
        content TEXT,
        created_date TIMESTAMP NOT NULL,
        modified_date TIMESTAMP NOT NULL,
        FOREIGN KEY (user_id) REFERENCES user (user_id),
        FOREIGN KEY (store_id) REFERENCES store (store_id)
      )
    ''');

    await db.execute('''
      CREATE TABLE menu (
        menu_id INTEGER PRIMARY KEY,
        store_id INTEGER NOT NULL,
        menu_picture_url TEXT,
        menu_name TEXT,
        menu_rating_average REAL NOT NULL,
        menu_category_id INTEGER NOT NULL,
        menu_info TEXT,
        menu_cost INTEGER,
        menu_review_count INTEGER,
        menu_favorites INTEGER,
        FOREIGN KEY (store_id) REFERENCES store (store_id)
      )
    ''');

    await db.execute('''
      CREATE TABLE order_item (
        menu_id INTEGER,
        store_id INTEGER,
        menu_picture_url TEXT,
        menu_cost INTEGER,
        menu_quantity INTEGER,
        menu_all_cost INTEGER,
        menu_eat TEXT,
        PRIMARY KEY (menu_id, store_id),
        FOREIGN KEY (menu_id) REFERENCES menu (menu_id),
        FOREIGN KEY (store_id) REFERENCES menu (store_id)
      )
    ''');

    // SQL 파일의 데이터를 테이블에 삽입하는 함수 호출
    await _insertSQLData(db);
  }

  Future<void> _insertSQLData(Database db) async {
    // SQL 파일 경로
    final sqlFiles = [
      'assets/dankook_coffee_menu.sql',
      'assets/dankook_coffee_review.sql',
      'assets/dankook_coffee_shopping.sql',
      'assets/dankook_coffee_store.sql',
      'assets/dankook_coffee_user.sql'
    ];

    for (final sqlFile in sqlFiles) {
      final sqlString = await rootBundle.loadString(sqlFile);
      final sqlCommands = sqlString.split(';');

      for (final command in sqlCommands) {
        if (command.trim().isNotEmpty) {
          await db.execute(command.trim());
        }
      }
    }
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

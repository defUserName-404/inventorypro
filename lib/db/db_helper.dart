import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/item.dart';
import '../models/user.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, 'inventory.db');

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT COLLATE NOCASE,
        role TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE items (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT COLLATE NOCASE,
        description TEXT,
        quantity INTEGER
      )
    ''');
  }

  // User operations
  Future<int> insertUser(User user) async {
    final db = await database;
    return await db.insert('users', user.toMap());
  }

  Future<List<User>> getUsers(String search) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: search.isNotEmpty ? 'name LIKE ?' : null,
      whereArgs: search.isNotEmpty ? ['%$search%'] : null,
    );
    return List.generate(maps.length, (i) => User.fromMap(maps[i]));
  }

  Future<int> insertItem(Item item) async {
    final db = await database;
    return await db.insert('items', item.toMap());
  }

  Future<List<Item>> getItems(String search) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'items',
      where: search.isNotEmpty ? 'name LIKE ?' : null,
      whereArgs: search.isNotEmpty ? ['%$search%'] : null,
    );
    return List.generate(maps.length, (i) => Item.fromMap(maps[i]));
  }
}

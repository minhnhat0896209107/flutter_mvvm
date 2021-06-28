import "package:path/path.dart";
import 'package:sqflite/sqflite.dart';

class SqliteDB {
  static final SqliteDB _instance = new SqliteDB.internal();

  factory SqliteDB() => _instance;
  static Database? _db;
  SqliteDB.internal();

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    var path = await getDatabasesPath();
    String db = join(path, "myDatabase.db");
    var taskDb = await openDatabase(db, version: 1);
    return taskDb;
  }
}

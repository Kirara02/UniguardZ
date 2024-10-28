import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UniguardDBHelper {
  static final UniguardDBHelper instance = UniguardDBHelper._internal();

  UniguardDBHelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'uniguardz_database.db');
    return openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            email TEXT
          )
        ''');
      },
      version: 1,
    );
  }
}

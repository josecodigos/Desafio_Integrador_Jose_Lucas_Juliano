import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/log.dart'; 

class DatabaseHelper {
  static Database? _database;

  // Initialize the database
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    // Create a new database if it doesn't exist
    _database = await _initDatabase();
    return _database!;
  }

  // Open the database
  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'logs.db');  // Database name is 'logs.db'

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      // Create the logs table
      await db.execute('''
        CREATE TABLE logs(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          endpoint TEXT,
          method TEXT,
          status TEXT,
          responseMessage TEXT,
          timestamp TEXT
        )
      ''');
    });
  }

  // Insert a log into the database
  Future<void> insertLog(Log log) async {
    final db = await database;
    await db.insert('logs', log.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Fetch all logs from the database
  Future<List<Log>> getLogs() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('logs');

    return List.generate(maps.length, (i) {
      return Log.fromMap(maps[i]);
    });
  }
}

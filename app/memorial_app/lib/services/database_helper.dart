import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/log.dart'; 

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    // Cria uma db nova se já não existir
    _database = await _initDatabase();
    return _database!;
  }

  //Inicializa a db
  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'logs.db');

    return openDatabase(path, version: 1, onCreate: (db, version) async {
        //Criar a tabela de logs
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

  //Insert de log
  Future<void> insertLog(Log log) async {
    final db = await database;
    await db.insert('logs', log.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  //Get dos logs
  Future<List<Log>> getLogs() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('logs');

    return List.generate(maps.length, (i) {
      return Log.fromMap(maps[i]);
    });
  }
}

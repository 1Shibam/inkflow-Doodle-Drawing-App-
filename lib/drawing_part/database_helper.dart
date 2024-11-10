// ignore_for_file: depend_on_referenced_packages

import 'package:inkflow/drawing_part/doodle_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'doodles.db');

    return openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE doodles(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            createdAt TEXT,
            drawingData TEXT
          )
          ''',
        );
      },
      version: 1,
    );
  }

  // Insert a new doodle
  Future<void> insertDoodle(Doodle doodle) async {
    final db = await database;
    await db.insert('doodles', doodle.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Retrieve all doodles
  Future<List<Doodle>> getDoodles() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('doodles');

    return List.generate(maps.length, (i) {
      return Doodle.fromMap(maps[i]);
    });
  }

  // Delete a doodle by ID
  Future<void> deleteDoodle(int id) async {
    final db = await database;
    await db.delete('doodles', where: 'id = ?', whereArgs: [id]);
  }
}

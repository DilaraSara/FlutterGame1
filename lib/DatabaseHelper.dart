import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }
  DatabaseHelper.internal();
  Future<Database> initDb() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "your_database.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }
  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE Questions(id INTEGER PRIMARY KEY, question TEXT)");
  }
  Future<int> saveQuestion(String question) async {
    var dbClient = await db;
    int res = await dbClient!.insert("Questions", {"question": question});
    return res;
  }

  Future<List<Map<String, dynamic>>> getQuestions() async {
    var dbClient = await db;
    List<Map<String, dynamic>> list = await dbClient!.rawQuery('SELECT * FROM Questions');
    return list;
  }
  void main() async {
    DatabaseHelper dbHelper = DatabaseHelper();

    // JSON dosyasından soruları oku ve veritabanına ekle
    String data = await rootBundle.loadString('assets/questions.json');
    List<dynamic> jsonList = json.decode(data);
    for (var question in jsonList) {
      await dbHelper.saveQuestion(question['question']);
    }

    // Veritabanından rastgele bir soru al ve ekrana yazdır
    List<Map<String, dynamic>> questions = await dbHelper.getQuestions();
    if (questions.isNotEmpty) {
      final random = Random();
      final randomIndex = random.nextInt(questions.length);
      print("Rastgele soru: ${questions[randomIndex]['question']}");
    } else {
      print("Veritabanında hiç soru yok.");
    }
  }

}

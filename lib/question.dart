import 'dart:math';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class question {
  static Future<void> initializeDatabase() async {
    final database = await openDatabase(
      join(await getDatabasesPath(), 'soru_veritabani.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE sorular(id INTEGER PRIMARY KEY, soru TEXT, cevap TEXT)",
        );
      },
      version: 1,
    );
    List<Map<String, dynamic>> soruCevaplar = [
      {'soru': 'Soru 1', 'cevap': 'Cevap 1'},
      {'soru': 'Soru 2', 'cevap': 'Cevap 2'},
      // Diğer soru ve cevaplar...
    ];

    for (var soruCevap in soruCevaplar) {
      await database.insert(
        'sorular',
        soruCevap,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  // Veritabanına bağlanmak için yardımcı metot
  static Future<Database> veritabaniniAc() async {
    return openDatabase(
      join(await getDatabasesPath(), 'soru_veritabani.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE sorular(id INTEGER PRIMARY KEY, soru TEXT, cevap TEXT)",
        );
      },
      version: 1,
    );
  }
  static Future<Map<String, dynamic>> getRastgeleSoru() async {
    final Database database = await veritabaniniAc();
    final List<Map<String, dynamic>> sorular = await database.query('sorular');
    return sorular[Random().nextInt(sorular.length)];
  }
  // Rastgele ve daha önce görülmemiş bir soru getiren metot
  Future<Map<String, dynamic>?> getUniqueRandomQuestion() async {
    // Veritabanına bağlan
    final Database database = await openDatabase(
      join(await getDatabasesPath(), 'soru_veritabani.db'),
    );

    // Tüm soruları veritabanından al
    final List<Map<String, dynamic>> allQuestions = await database.query('sorular');

    // Daha önce görülmemiş soruları tutmak için bir liste oluştur
    List<Map<String, dynamic>> unseenQuestions = List.from(allQuestions);

    // Eğer hiç soru kalmadıysa null döndür
    if (unseenQuestions.isEmpty) return null;

    // Rastgele bir indeks seç
    final int randomIndex = Random().nextInt(unseenQuestions.length);

    // Rastgele soruyu seç
    final Map<String, dynamic> randomQuestion = unseenQuestions[randomIndex];

    // Seçilen soruyu görülmüşler listesinden kaldır
    unseenQuestions.removeAt(randomIndex);

    // Seçilen soruyu döndür
    return randomQuestion;
  }
// Diğer veritabanı işlemleri metotları da buraya eklenebilir
}
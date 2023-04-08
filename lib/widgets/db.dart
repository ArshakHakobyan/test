import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  Future<void> copyDatabase() async {
    // Получаем ссылку на директорию, где будет храниться база данных
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/telCell.db';

    // Проверяем, существует ли база данных в этой директории
    final file = File(path);
    if (!await file.exists()) {
      // Если базы данных нет, копируем ее из assets
      final data = await rootBundle.load('assets/telCell.db');
      final bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes);
    }
  }

  Future<Database> openMyDatabase() async {
    // Получаем ссылку на директорию, где хранится база данных
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'mydatabase.db');

    // Открываем базу данных
    return openDatabase(path, version: 1, onCreate: (db, version) {
      // Создаем таблицу, если она еще не создана
      db.execute(
          'CREATE TABLE credit_cards (id TEXT PRIMARY KEY, card_number INTEGER, card_holder TEXT, expiration_date INTEGER)');
    });
  }

  Future<List<Map<String, dynamic>>> readDataFromDatabase() async {
    // Открываем базу данных
    final db = await openMyDatabase();

    // Выполняем запрос к базе данных
    final result = await db.query('credit_cards');

    // Закрываем базу данных
    await db.close();

    // Возвращаем результат запроса
    return result;
  }
}

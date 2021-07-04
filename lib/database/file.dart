/// database sample

import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Utils {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = openDatabase(
    join(await getDatabasesPath(), 'wordbase.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE words(id INTEGER PRIMARY KEY, name TEXT)',
      );
    },
    version: 1,
  );

  Future<void> insertWord(Word word) async {
    final db = await database;

    await db.insert(
      'words',
      word.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Word>> words() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('words');

    return List.generate(maps.length, (i) {
      return Word(
        id: maps[i]['id'],
        name: maps[i]['name'],
      );
    });
  }

  Future<void> updateWord(Word word) async {
    final db = await database;

    await db.update(
      'words',
      word.toMap(),
      where: 'id = ?',
      whereArgs: [word.id],
    );
  }

  Future<void> deleteWord(int id) async {
    final db = await database;

    await db.delete(
      'words',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

class Word {
  final int id;
  final String name;

  Word({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  String toString() {
    return 'Word{id: $id, name: $name}';
  }
}

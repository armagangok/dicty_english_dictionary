import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _databaseName = 'wordbase.db';
  static final _dbVersion = 1;
  static final _tableName = 'wordbase';
  static final columnID = '_id';
  static final columnName = 'words';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database == null) {
      _database = await _initiateDatabase();
    }
    return _database!;
  }

  Future _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _databaseName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute("""
    CREATE TABLE $_tableName( 
    $columnID INTEGER PRIMARY KEY,
    $columnName TEXT NOT NULL )
    """);
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.database;
    return await db.query(_tableName);
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnID];
    return await db
        .update(_tableName, row, where: '$columnID = ?', whereArgs: [id]);
  }

  Future delete(int id) async {
    Database db = await instance.database;
    return await db.delete(_tableName, where: '$columnID=?', whereArgs: [id]);
  }
}













































// class DatabaseHelper {
//   static DatabaseHelper? _databaseHelper;
//   static Database? _database;
//   DatabaseHelper._createInstance();

//   String wordTable = 'word_table';
//   String idCol = 'id';
//   String textCol = 'text';

//   factory DatabaseHelper() {
//     if (_databaseHelper == null) {
//       _databaseHelper = DatabaseHelper._createInstance();
//     }
//     return _databaseHelper!;
//   }

//   Future<Database> get database async {
//     if (_database == null) {
//       _database = await initDB();
//     }
//     return database;
//   }

//   Future<Database> initDB() async {
//     Directory directory = await getApplicationDocumentsDirectory();
//     String path = directory.path + 'wordbase.db';

//     var wordbaseDB = await openDatabase(path, version: 1, onCreate: _createDB);
//     return wordbaseDB;
//   }

//   void _createDB(Database db, int version) async {
//     await db.execute(
//       'CREATE TABLE $wordTable($idCol INTEGER PRIMARY KEY AUTOINCREMENT,$textCol)',
//     );
//   }

//   Future<List<Map<String, dynamic>>> getNoteMapList() async {
//     Database db = await this.database;
//     var result = await db.rawQuery('SELECT * FROM $wordTable');
//     // var result = await db.query(wordTable);
//     return result;
//   }

//   Future<int> insertWord(Note text) async {
//     Database db = await this.database;
//     var result = await db.insert(wordTable, text.toMap());
//     return result;
//   }

//   Future<int> updateWord(Note text) async {
//     var db = await this.database;
//     var result = await db
//         .update(textCol, text.toMap(), where: '$idCol', whereArgs: [text.id]);
//     return result;
//   }

//   updateNote(note) {}
// }

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  DatabaseManager._private();

  static DatabaseManager instance = DatabaseManager._private();

  Database? _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDb();
    }

    return _db!;
  }

  Future _initDb() async {
    Directory docDir = await getApplicationSupportDirectory();

    String path = join(docDir.path, "bookmarks.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (database, version) async {
        return await database.execute(
          '''
            CREATE TABLE bookmarks (
              id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
              surah TEXT NOT NULL,
              ayat INTEGER NOT NULL,
              index_ayat INTEGER NOT NULL,
              arab TEXT NOT NULL,
              transliteration TEXT NOT NULL,
              arti TEXT NOT NULL
            )
          '''
        );
      }
    );
  }

  Future _closeDb() async {
    _db = await instance.db;
    _db!.close();
  }
}
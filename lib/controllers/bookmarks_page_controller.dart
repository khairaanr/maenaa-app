import 'package:maenaa/database/bookmark.dart';
import 'package:sqflite/sqflite.dart';

class bookmarkController {

  DatabaseManager database = DatabaseManager.instance;

  void deleteBookmark(int id) async {
    Database db = await database.db;
    await db.delete("bookmarks", where: "id = ${id}");
  }

  Future<List<Map<String, dynamic>>> getBookmark() async {
    Database db = await database.db;
    List<Map<String, dynamic>> allBookmarks = await db.query('bookmarks');
    return allBookmarks;
  }
}
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:maenaa/database/bookmark.dart';
import 'package:maenaa/models/detail_surah_model.dart';
import 'package:maenaa/models/surah_model.dart';
import 'package:sqflite/sqflite.dart';

class detailController {
  DatabaseManager database = DatabaseManager.instance;

  Future<DetailSurah> getDetailSurah(String id) async {
    Uri url = Uri.parse("https://api.quran.gading.dev/surah/$id");
    var res = await http.get(url);

    Map<String, dynamic> data =
        (json.decode(res.body) as Map<String, dynamic>)['data'];

    return DetailSurah.fromJson(data);
  }

  Future<bool> addBookmark(DetailSurah surah, Verse ayat, int index) async {
    Database db = await database.db;
    bool flagExist = false;

    List checkData = await db.query('bookmarks',
        where:
            'surah = "${surah.name.transliteration.id}" AND ayat = ${ayat.number.inSurah}');

    if (checkData.isNotEmpty) {
      flagExist = true;
    }

    if (flagExist == false) {
      await db.insert("bookmarks", {
        "surah": "${surah.name.transliteration.id}",
        "ayat": ayat.number.inSurah,
        "index_ayat": index
      });

      var data = await db.query('bookmarks');
      print(data);

      return true;

    } else {
      return false;
    }
  }
}

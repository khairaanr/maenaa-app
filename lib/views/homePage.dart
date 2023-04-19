import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:maenaa/controllers/homePageController.dart';

import '../models/surah_models.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home page'),
        ),
        
        body: FutureBuilder<List<Surah>>(
          future: homeContoller().getAllSurah(),
          builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData) {
            return Center(
              child: Text("Data kosong"),
            );
          }

          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Surah surah = snapshot.data![index];
                return ListTile(
                    leading: CircleAvatar(
                      child: Text("${surah.number}"),
                    ),
                    title: Text("${surah.name.transliteration.id}"),
                    subtitle: Text("${surah.numberOfVerses} ayat"),
                    trailing: Text("${surah.name.short}"),
                  );
              }
              );
        }));
  }
}

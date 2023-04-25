import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:maenaa/controllers/home_page_controller.dart';
import 'package:maenaa/utils/myColors.dart';

import '../models/surah_model.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appColors.background,
        appBar: AppBar(
          backgroundColor: appColors.background,
          title: Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              width: 120,
              'assets/logo-typo.png',
            ),
          ),
          elevation: 0,
        ),
        body: FutureBuilder<List<Surah>>(
            future: homeController().getAllSurah(),
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

              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Align(
                          child: Text(
                            "Halo,",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: appColors.hitam),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Align(
                          child: Text(
                            "Surah apa yang ingin dibaca hari ini?",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: appColors.hitam),
                          ),
                          alignment: Alignment.centerLeft,
                        )
                      ],
                    ),
                  ),
                  Flexible(
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          Surah surah = snapshot.data![index];
                          return ListTile(
                            onTap: () {
                              Navigator.pushNamed(context, "/details",
                                  arguments: surah);
                            },
                            leading: CircleAvatar(
                              backgroundImage: AssetImage("assets/number.png"),
                              child: Text(
                                "${surah.number}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: appColors.coklatTua),
                              ),
                            ),
                            title: Text(
                              "${surah.name.transliteration.id}",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: appColors.hitam,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "${surah.numberOfVerses} Ayat | ${surah.revelation.id}",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: appColors.coklatTua,
                                  fontWeight: FontWeight.w400),
                            ),
                            trailing: Text(
                              "${surah.name.short}",
                              style: TextStyle(fontSize: 16),
                            ),
                          );
                        }),
                  ),
                ],
              );
            }),
          
        );
  }
}

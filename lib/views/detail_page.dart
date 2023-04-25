import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:maenaa/models/detail_surah_model.dart' as detail;
import 'package:maenaa/models/surah_model.dart';
import 'package:maenaa/controllers/detail_page_controller.dart';
import 'package:maenaa/utils/myColors.dart';

class detailPage extends StatefulWidget {
  const detailPage({super.key});

  @override
  State<detailPage> createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  @override
  Widget build(BuildContext context) {
    final surah = ModalRoute.of(context)!.settings.arguments as Surah;
    return Scaffold(
      backgroundColor: appColors.background,
      appBar: AppBar(
        toolbarHeight: 72,
        title: Text(
          "Q.S ${surah.name.transliteration.id}",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        backgroundColor: appColors.biru,
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Card(
            color: appColors.background,
            elevation: 0,
            child: Column(
              children: [
                Column(
                  children: [
                    Text(
                      "${surah.name.translation.id}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Surah ke-${surah.number}     |     ${surah.numberOfVerses} Ayat     |     ${surah.revelation.id}",
                    ),
                    SizedBox(
                      height: 16,
                    )
                  ],
                )
              ],
            ),
          ),
          FutureBuilder<detail.DetailSurah>(
              future:
                  detailController().getDetailSurah(surah.number.toString()),
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
                  children: [
                    showBismillah(surah.number, snapshot.data?.preBismillah),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: surah.numberOfVerses,
                      itemBuilder: (context, index) {
                        detail.Verse? ayat = snapshot.data?.verses[index];
                        return Column(
                          children: [
                            Card(
                              color: appColors.background,
                              elevation: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        CircleAvatar(
                                          backgroundImage:
                                              AssetImage("assets/number.png"),
                                          child: Text(
                                            "${index + 1}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: appColors.coklatTua),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              width: 280,
                                              child: Text(
                                                "${ayat!.text.arab}",
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                    color: appColors.hitam),
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Container(
                                                width: 280,
                                                child: Text(
                                                  "${ayat.text.transliteration.en}",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: appColors.hitam),
                                                  textAlign: TextAlign.right,
                                                )),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Container(
                                                width: 280,
                                                child: Text(
                                                  "${ayat.translation.id}",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: appColors.abu,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  textAlign: TextAlign.left,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.bookmark_add_outlined,
                                              color: appColors.hitam,
                                            ))
                                      ],
                                    ),
                                    dividerColumn()
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                );
              })
        ],
      ),
    );
  }
}

Widget dividerColumn() {
  return Container(
    width: 350,
    height: 1,
    decoration: BoxDecoration(
        color: Color(0xFF9D968F),
        borderRadius: BorderRadius.all(Radius.circular(1))),
  );
}

Widget showBismillah(int index, detail.PreBismillah? bismillah) {
  if (index != 1) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Center(
        child: Column(
          children: [
            Text("${bismillah?.text.arab}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            SizedBox(
              height: 12,
            ),
            Text(
              "${bismillah?.text.transliteration.en}",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            Text("${bismillah?.translation.id}",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF7F8184),
                    fontWeight: FontWeight.w500)),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  } else {
    return Container();
  }
}

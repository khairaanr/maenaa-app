import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:maenaa/controllers/bookmarks_page_controller.dart';
import 'package:maenaa/utils/myColors.dart';

class bookmarksPage extends StatefulWidget {
  const bookmarksPage({super.key});

  @override
  State<bookmarksPage> createState() => _bookmarksPageState();
}

class _bookmarksPageState extends State<bookmarksPage> {
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
      body: Container(
        child: FutureBuilder(
            future: bookmarkController().getBookmark(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.data?.length == 0) {
                return Center(
                  child: Text('Tidak ada bookmark'),
                );
              }

              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> data = snapshot.data![index];
                    return ListTile(
                      onTap: () {
                        print(data);
                      },
                      title: Text("${data['surah']}", style: TextStyle(fontWeight: FontWeight.bold, color: appColors.hitam),),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/number.png'),
                        child: Text("${data['ayat']}",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: appColors.coklatTua)),
                      ),
                      subtitle: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                        width: 280,
                        child: Column(
                          children: [
                            Container(
                              width: 280,
                              child: Text(
                                "${data['arab']}",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: appColors.hitam),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            SizedBox(height: 8,),
                            Container(
                              width: 280,
                              child: Text(
                                "${data['transliteration']}",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w500,
                                    color: appColors.hitam),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text(
                              "${data['arti']}",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: appColors.abu,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.left,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        bookmarkController()
                                            .deleteBookmark(data['id']);
                                      });
                                    },
                                    icon: Icon(Icons.delete))
                              ],
                            ),
                            dividerColumn(),
                          ],
                        ),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}


Widget dividerColumn() {
  return Container(
    width: 350,
    height: 1,
    decoration: BoxDecoration(
        color: appColors.coklatTua,
        borderRadius: BorderRadius.all(Radius.circular(1))),
  );
}
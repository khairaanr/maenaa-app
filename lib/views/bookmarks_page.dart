import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:maenaa/controllers/bookmarks_page_controller.dart';

class bookmarksPage extends StatefulWidget {
  const bookmarksPage({super.key});

  @override
  State<bookmarksPage> createState() => _bookmarksPageState();
}

class _bookmarksPageState extends State<bookmarksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bookmarks"),
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
            return Center(child: Text('Tidak ada bookmark'),);
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> data = snapshot.data![index];
            return ListTile(
              onTap: () {
              print(data);
            },
            title: Text("${data['surah']}"),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/number.png'), child: Text("${data['ayat']}"),
            ),
            subtitle: Column(
              children: [
                Text("arab"),
                Text("transliteration"),
                Text("arti"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(onPressed: () {
                      bookmarkController().deleteBookmark(data['id']);
                    }, icon: Icon(Icons.delete))
                  ],
                )
              ],
            ),
            );
          });
        }),
      ),
    );
  }
}

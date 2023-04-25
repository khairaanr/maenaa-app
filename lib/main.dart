import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maenaa/views/bookmarksPage.dart';
import 'package:maenaa/views/detailPage.dart';
import 'views/homePage.dart';
import 'views/landingPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'maenaa',
      initialRoute: '/landing',
      routes: {
        '/landing': (context) => landingPage(),
        '/home': (context) => homePage(),
        '/details': (context) => detailPage(),
        '/bookmarks': (context) => bookmarksPage(),
      },
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
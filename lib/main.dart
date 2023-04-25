import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:maenaa/utils/myColors.dart';
import 'package:maenaa/views/detail_page.dart';
import 'views/bookmarks_page.dart';
import 'views/home_page.dart';
import 'views/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'maenaa',
      initialRoute: '/landing',
      routes: {
        '/landing': (context) => const landingPage(),
        '/details': (context) => const detailPage(),
      },
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyDefault extends StatefulWidget {
  const MyDefault({super.key, required this.title});

  final String title;

  @override
  State<MyDefault> createState() => _MyDefaultState();
}

class _MyDefaultState extends State<MyDefault> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    homePage(),
    bookmarksPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex)
      ),
      bottomNavigationBar: Container(
          child: SafeArea(
            child: GNav(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 64),
              activeColor: appColors.biru,
              backgroundColor: appColors.background,
              color: appColors.coklatTua,
              gap: 8,
              tabs: [
                GButton(
                  icon: Icons.book,
                  text: "Al-Qur'an",
                ),
                GButton(
                  icon: Icons.bookmark,
                  text: "Bookmarks",
                )
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
    );
  }
}
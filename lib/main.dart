import 'package:flutter/material.dart';
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
      },
    );
  }
}
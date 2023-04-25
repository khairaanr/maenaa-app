import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class bookmarksPage extends StatefulWidget {
  const bookmarksPage({super.key});

  @override
  State<bookmarksPage> createState() => _bookmarksPageState();
}

class _bookmarksPageState extends State<bookmarksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: Text("bookmarkpage"),),);
  }
}
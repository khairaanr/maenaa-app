import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:maenaa/models/surah_models.dart';

class detailPage extends StatefulWidget {
  const detailPage({super.key});

  @override
  State<detailPage> createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  static const routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final surah = ModalRoute.of(context)!.settings.arguments as Surah;
    return Scaffold(
      body: Text("${surah.name.transliteration.id}"),
    );
  }
}
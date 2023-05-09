import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:maenaa/main.dart';
import 'package:maenaa/utils/myColors.dart';

class landingPage extends StatelessWidget {
  const landingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appColors.background,
        appBar: AppBar(
          backgroundColor: appColors.background,
          title: Align(
              alignment: Alignment.center,
              child: Image.asset(
                width: 120,
                'assets/logo-typo.png',
              )),
          elevation: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 36),
              Container(
                width: 300,
                height: 300,
                child: Image.asset("assets/landingpage.png"),
              ),
              SizedBox(
                height: 58,
              ),
              Container(
                child: Text(
                  "Al-qur'an digital\nterjemahan Indonesia",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 36,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyDefault(
                                  title: 'maenaa',
                                )));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appColors.biru,
                    padding: EdgeInsets.symmetric(horizontal: 36, vertical: 16),
                    
                  ),
                  child: Text("Masuk")),
            ],
          ),
        ));
  }
}

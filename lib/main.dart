import 'package:flutter/material.dart';
import 'package:grade_calculator_app/pages/home_page.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:grade_calculator_app/pages/intro_page.dart';

void main() async {
  await Hive.initFlutter();

  var box = await Hive.openBox("myBox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroductionPage(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

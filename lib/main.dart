import 'package:flutter/material.dart';
import 'package:grade_calculator_app/pages/home_page.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:grade_calculator_app/pages/intro_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await Hive.initFlutter();

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  var box = await Hive.openBox("myBox");

  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;

  const MyApp({Key? key, required this.showHome}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: showHome ? HomePage() : IntroductionPage(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

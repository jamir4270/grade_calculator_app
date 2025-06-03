import 'package:flutter/material.dart';
import 'package:grade_calculator_app/components/grade_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List gradeList = [
    ["Subject", 3.0, 1.0],
    ["Subject", 3.0, 1.0],
    ["Subject", 3.0, 1.0],
    ["Subject", 3.0, 1.0],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grade Calculator"),
        backgroundColor: Colors.blue[200],
        actions: [
          Padding(padding: const EdgeInsets.all(8.0), child: Text("Calculate")),
        ],
      ),
      body: ListView.builder(
        itemCount: gradeList.length,
        itemBuilder: (context, index) {
          return GradeTile(
            subjectName: gradeList[index][0],
            grade: gradeList[index][1],
            units: gradeList[index][2],
          );
        },
      ),
    );
  }
}

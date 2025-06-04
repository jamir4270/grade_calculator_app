import 'package:flutter/material.dart';
import 'package:grade_calculator_app/components/grade_dialog_box.dart';
import 'package:grade_calculator_app/components/grade_tile.dart';
import 'package:grade_calculator_app/components/my_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final subjectController = TextEditingController();
  final unitsController = TextEditingController();
  final gradeController = TextEditingController();

  void saveNewGrade(String subject, double units, double grade) {
    setState(() {
      gradeList.add([subject, units, grade]);
    });
    Navigator.of(context).pop();
  }

  List gradeList = [
    ["Subject", 3.0, 1.0],
  ];

  void createNewGradeTile() {
    showDialog(
      context: context,
      builder: (context) {
        return GradeDialogBox(
          subjectTextController: subjectController,
          unitsTextController: unitsController,
          gradeTextController: gradeController,
          onSavePressed: () {
            String subject = subjectController.text;
            double? units = double.parse(unitsController.text);
            double? grade = double.parse(gradeController.text);

            saveNewGrade(subject, units, grade);
          },
          onCancelPressed: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void onCalculatePressed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grade Calculator"),
        backgroundColor: Colors.blue[200],
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: onCalculatePressed,
              child: Text(
                "Calculate",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.deepOrange, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: gradeList.length,
        itemBuilder: (context, index) {
          return GradeTile(
            subjectName: gradeList[index][0],
            units: gradeList[index][1],
            grade: gradeList[index][2],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewGradeTile,
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add),
      ),
    );
  }
}

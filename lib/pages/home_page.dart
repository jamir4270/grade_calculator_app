import 'package:flutter/material.dart';
import 'package:grade_calculator_app/components/grade_dialog_box.dart';
import 'package:grade_calculator_app/components/grade_tile.dart';
import 'package:grade_calculator_app/components/gwa_dialog.dart';
import 'package:grade_calculator_app/database/database.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box("myBox");
  GradeDataBase GradeDB = GradeDataBase();

  @override
  void initState() {
    if (_myBox.get("GRADELIST") == null) {
      GradeDB.intializeMockData();
    } else {
      GradeDB.loadData();
    }
    super.initState();
  }

  final subjectController = TextEditingController();
  final unitsController = TextEditingController();
  final gradeController = TextEditingController();

  void saveNewGrade(String subject, double units, double grade) {
    setState(() {
      GradeDB.gradeList.add([subject, units, grade]);
    });
    Navigator.of(context).pop();
    GradeDB.updateDatabase();
  }

  void createNewGradeTile() {
    showDialog(
      context: context,
      builder: (context) {
        return GradeDialogBox(
          subjectTextController: subjectController,
          unitsTextController: unitsController,
          gradeTextController: gradeController,
          onSavePressed: () {
            if (checkSubjectName(subjectController.text)) {
              checkUnits(unitsController.text);
              checkGrade(gradeController.text);

              String subject = subjectController.text;
              double? units = double.parse(unitsController.text);
              double? grade = double.parse(gradeController.text);

              saveNewGrade(subject, units, grade);
            } else {
              return;
            }
          },
          onCancelPressed: () => Navigator.of(context).pop(),
        );
      },
    );
    clearTextControllers();
    GradeDB.updateDatabase();
  }

  void editGradeTile(
    int index,
    String subjectName,
    double units,
    double grade,
  ) {
    setState(() {
      GradeDB.gradeList[index][0] = subjectName;
      GradeDB.gradeList[index][1] = units;
      GradeDB.gradeList[index][2] = grade;
    });
    Navigator.of(context).pop();
    clearTextControllers();
    GradeDB.updateDatabase();
  }

  void clearTextControllers() {
    subjectController.clear();
    unitsController.clear();
    gradeController.clear();
  }

  void onCalculatePressed() {
    if (GradeDB.gradeList.isEmpty) {
      displaySnackBar("There are no grades to calculate.");
    } else {
      showDialog(
        context: context,
        builder: (context) {
          double gwa = 0.0;
          double totalUnits = 0.0;
          double sumOfWeightedGrades = 0.0;
          for (int i = 0; i < GradeDB.gradeList.length; i++) {
            totalUnits += GradeDB.gradeList[i][1];
            sumOfWeightedGrades +=
                GradeDB.gradeList[i][1] * GradeDB.gradeList[i][2];
          }
          gwa = sumOfWeightedGrades / totalUnits;
          return GeneralWeightedAverageDialog(GWA: gwa);
        },
      );
    }
  }

  void fetchGrade(int index) {
    showDialog(
      context: context,
      builder: (context) {
        subjectController.text = GradeDB.gradeList[index][0];
        unitsController.text = GradeDB.gradeList[index][1].toString();
        gradeController.text = GradeDB.gradeList[index][2].toString();

        return GradeDialogBox(
          subjectTextController: subjectController,
          unitsTextController: unitsController,
          gradeTextController: gradeController,
          onCancelPressed: () => Navigator.of(context).pop(),
          onSavePressed: () {
            if (checkSubjectName(subjectController.text)) {
              checkUnits(unitsController.text);
              checkGrade(gradeController.text);

              String subjectName = subjectController.text;
              double? units = double.parse(unitsController.text);
              double? grade = double.parse(gradeController.text);

              editGradeTile(index, subjectName, units, grade);
            } else {
              return;
            }
          },
          titleName: "Edit Grade",
        );
      },
    );
  }

  void deleteTile(int index) {
    setState(() {
      GradeDB.gradeList.removeAt(index);
    });
    GradeDB.updateDatabase();
  }

  bool checkSubjectName(String subjectName) {
    if (double.tryParse(subjectName) != null || subjectName.isEmpty) {
      subjectController.clear();
      displaySnackBar("Invalid subject name.");
      return false;
    }
    return true;
  }

  void checkGrade(String gradeText) {
    if (double.tryParse(gradeText) == null) {
      gradeController.clear();
      displaySnackBar("Invalid grade input. Input must be numbers.");
      return;
    }

    if (double.parse(gradeText) > 5.0 || double.parse(gradeText) < 1.0) {
      gradeController.clear();
      displaySnackBar("Invalid grade input. Adhere to the given range.");
    }
  }

  void checkUnits(String unitsText) {
    if (double.tryParse(unitsText) == null) {
      unitsController.clear();
      displaySnackBar("Invalid units input. Input must be numbers.");
      return;
    }

    if (double.parse(unitsText) > 5.0 || double.parse(unitsText) < 1.0) {
      unitsController.clear();
      displaySnackBar("Invalid units input. Adhere to the given range.");
    }
  }

  void displaySnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: Color(0xffebebeb))),
        duration: Duration(milliseconds: 500),
        backgroundColor: Color(0xff004e98),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffebebeb),
      appBar: AppBar(
        title: Text("GWACalc", style: TextStyle(color: Color(0xffebebeb))),
        backgroundColor: Color(0xff004e98),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: onCalculatePressed,
              style: ElevatedButton.styleFrom(
                overlayColor: Color.fromARGB(255, 85, 40, 11),
                foregroundColor: Color(0xffff6700),
              ),
              child: Text(
                "Calculate",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: GradeDB.gradeList.length,
        itemBuilder: (context, index) {
          return GradeTile(
            subjectName: GradeDB.gradeList[index][0],
            units: GradeDB.gradeList[index][1],
            grade: GradeDB.gradeList[index][2],
            onGradeTileTap: () {
              fetchGrade(index);
            },
            onExitPressed: () {
              deleteTile(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewGradeTile,
        backgroundColor: Color(0xffff6700),
        child: Icon(Icons.add, color: Color(0xffebebeb)),
      ),
    );
  }
}

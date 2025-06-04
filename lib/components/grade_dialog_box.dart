import 'package:flutter/material.dart';
import 'package:grade_calculator_app/components/my_button.dart';

class GradeDialogBox extends StatelessWidget {
  final subjectTextController;
  final unitsTextController;
  final gradeTextController;

  final VoidCallback onCancelPressed;
  final VoidCallback onSavePressed;

  GradeDialogBox({
    super.key,
    required this.subjectTextController,
    required this.unitsTextController,
    required this.gradeTextController,
    required this.onCancelPressed,
    required this.onSavePressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add New Grade", textAlign: TextAlign.center),
      content: SizedBox(
        height: 270,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text("Subject: "),
                Expanded(
                  child: TextField(
                    maxLength: 10,
                    controller: subjectTextController,
                    decoration: InputDecoration(
                      hintText: "Subject",
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text("Units: "),
                Expanded(
                  child: TextField(
                    controller: unitsTextController,
                    decoration: InputDecoration(
                      hintText: "1.0 - 6.0",
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text("Grade: "),
                Expanded(
                  child: TextField(
                    controller: gradeTextController,
                    decoration: InputDecoration(
                      hintText: "1.0 - 5.0",
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 45.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(
                    buttonName: "Cancel",
                    buttonColor: Colors.deepOrange,
                    onPressed: onCancelPressed,
                  ),
                  MyButton(
                    buttonName: "Save",
                    buttonColor: Colors.greenAccent,
                    onPressed: onSavePressed,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

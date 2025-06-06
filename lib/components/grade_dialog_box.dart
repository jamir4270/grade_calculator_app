import 'package:flutter/material.dart';
import 'package:grade_calculator_app/components/my_button.dart';

class GradeDialogBox extends StatelessWidget {
  final String titleName;

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
    this.titleName = "Add New Grade",
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        titleName,
        textAlign: TextAlign.center,
        style: TextStyle(color: Color(0xff004e98)),
      ),
      backgroundColor: Color(0xffebebeb),
      content: SizedBox(
        height: 270,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  "Subject: ",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(color: Color(0xff3a6ea5)),
                ),
                Expanded(
                  child: TextField(
                    controller: subjectTextController,
                    decoration: InputDecoration(
                      hintText: "Subject",
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text("Units: ", style: TextStyle(color: Color(0xff3a6ea5))),
                Expanded(
                  child: TextField(
                    controller: unitsTextController,
                    decoration: InputDecoration(
                      hintText: "1.0 - 6.0",
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                    ),
                    keyboardType: TextInputType.numberWithOptions(
                      signed: false,
                      decimal: true,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text("Grade: ", style: TextStyle(color: Color(0xff3a6ea5))),
                Expanded(
                  child: TextField(
                    controller: gradeTextController,
                    decoration: InputDecoration(
                      hintText: "1.0 - 5.0",
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                    ),
                    keyboardType: TextInputType.numberWithOptions(
                      signed: false,
                      decimal: true,
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
                    buttonColor: Color(0xffff6700),
                    onPressed: onCancelPressed,
                  ),
                  MyButton(
                    buttonName: "Save",
                    buttonColor: Color(0xff004e98),
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

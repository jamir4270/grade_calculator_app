import 'package:flutter/material.dart';

class GradeTile extends StatelessWidget {
  GradeTile({
    super.key,
    required this.subjectName,
    required this.units,
    required this.grade,
  });

  final String subjectName;
  final double units;
  final double grade;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        width: 200,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    subjectName,
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  Text("Units: $units", style: TextStyle(fontSize: 20)),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Grade", style: TextStyle(fontSize: 15)),
                  Text("$grade", style: TextStyle(fontSize: 40)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

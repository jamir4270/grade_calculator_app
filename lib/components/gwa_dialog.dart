import 'package:flutter/material.dart';

class GeneralWeightedAverageDialog extends StatelessWidget {
  final double GWA;
  const GeneralWeightedAverageDialog({super.key, required this.GWA});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Grade", textAlign: TextAlign.center),
      content: SizedBox(
        height: 150,
        child: Column(children: [Text("Your GWA is: "), Text("$GWA")]),
      ),
    );
  }
}

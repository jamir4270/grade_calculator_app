import 'package:flutter/material.dart';

class GeneralWeightedAverageDialog extends StatelessWidget {
  final double GWA;
  const GeneralWeightedAverageDialog({super.key, required this.GWA});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Align(
        alignment: Alignment.center,
        child: Text("General Weighted Average", textAlign: TextAlign.center),
      ),
      content: SizedBox(
        height: 150,
        child: Text(
          "$GWA",
          style: TextStyle(fontSize: 50),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

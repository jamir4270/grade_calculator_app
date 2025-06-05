import 'package:flutter/material.dart';

class GeneralWeightedAverageDialog extends StatelessWidget {
  final double GWA;
  const GeneralWeightedAverageDialog({super.key, required this.GWA});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Align(
        alignment: Alignment.center,
        child: Text(
          "General Weighted Average",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color(0xff004e98),
          ),
        ),
      ),
      content: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              GWA.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 50,
                color: Color(0xffff6700),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

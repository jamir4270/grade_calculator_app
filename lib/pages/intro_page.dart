import 'package:flutter/material.dart';
import 'package:grade_calculator_app/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroductionPage extends StatefulWidget {
  IntroductionPage({super.key});

  static const Color primaryOrange = Color(0xffff6700);
  static const Color lightGrey = Color(0xffebebeb);
  static const Color mediumGrey = Color(0xffc0c0c0);
  static const Color darkBlue = Color(0xff004e98);

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 80.0),
        child: Column(
          children: [
            Flexible(
              flex: 3,
              child: Container(
                color: IntroductionPage.darkBlue,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Welcome to",
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.w400,
                        color: IntroductionPage.lightGrey,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "GWUCalc",
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: IntroductionPage.primaryOrange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 8,
              child: Container(
                color: IntroductionPage.lightGrey,
                width: double.infinity,
                height: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 50.0,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInstructionPoint(
                        "1.",
                        "Easily add subjects with their units and grades, and let us do the math for you.",
                      ),
                      const SizedBox(height: 30),
                      _buildInstructionPoint(
                        "2.",
                        "You can tap on any grade tile to edit it or remove it using the 'X' button.",
                      ),
                      const SizedBox(height: 30),
                      _buildInstructionPoint(
                        "3.",
                        "Track your academic progress effortlessly and aim for success!",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: SizedBox(
        height: 80,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: TextButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('showHome', true);

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: IntroductionPage.darkBlue,
                  foregroundColor: IntroductionPage.lightGrey,
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: const Text(
                  "Get Started",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructionPoint(String number, String instructionText) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: IntroductionPage.primaryOrange,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            instructionText,
            style: const TextStyle(
              fontSize: 20,
              color: IntroductionPage.darkBlue,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GradeDataBase {
  List gradeList = [];

  final _myBox = Hive.box("myBox");

  void intializeMockData() {
    gradeList = [
      ["CourseName", 3.0, 1.5],
    ];
  }

  void loadData() {
    gradeList = _myBox.get("GRADELIST");
  }

  void updateDatabase() {
    _myBox.put("GRADELIST", gradeList);
  }
}

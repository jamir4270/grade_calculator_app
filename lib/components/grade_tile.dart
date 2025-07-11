import 'package:flutter/material.dart';

class GradeTile extends StatelessWidget {
  GradeTile({
    super.key,
    required this.subjectName,
    required this.units,
    required this.grade,
    required this.onGradeTileTap,
    required this.onExitPressed,
  });

  final String subjectName;
  final double units;
  final double grade;

  VoidCallback onGradeTileTap;
  VoidCallback onExitPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onGradeTileTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Container(
          width: 200,
          height: 150,
          decoration: BoxDecoration(
            color: Color(0xff3a6ea5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                  bottom: 15.0,
                ),
                child: Column(
                  children: [
                    Flexible(child: Container()),
                    Flexible(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              subjectName,
                              style: TextStyle(
                                fontSize: 40,
                                color: Color(0xffebebeb),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                "Grade",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xffc0c0c0),
                                ),
                              ),
                              Text(
                                "$grade",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Color(0xffebebeb),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Units: $units",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xffc0c0c0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: IconButton(
                    onPressed: onExitPressed,
                    style: IconButton.styleFrom(
                      padding: EdgeInsets.zero,
                      iconSize: 24,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    icon: Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          Icons.close_rounded,
                          size: 26,
                          color: Color(0xff004e98),
                        ),
                        Icon(
                          Icons.close_rounded,
                          size: 20,
                          color: Color(0xffff6700),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

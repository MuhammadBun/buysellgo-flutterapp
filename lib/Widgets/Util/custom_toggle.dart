import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Core/Constants/my_colors.dart';
  

class ToggleButtonDate extends StatefulWidget {
  const ToggleButtonDate({super.key});

  @override
  _ToggleButtonDateState createState() => _ToggleButtonDateState();
}

class _ToggleButtonDateState extends State<ToggleButtonDate> {
  List list = [true, false, false, false];
  Widget container(String text, Color? boxColor, Color? textColor) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 10),
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 25, 24, 24), borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 5),
            child: Text(
              "Date",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      list[0] = !list[0];
                      list[1] = false;
                      list[2] = false;
                      list[3] = false;
                    });
                  },
                  child: !list[0]
                      ? container(
                          "Today", ColorsConstants.primaryColor, Colors.white)
                      : container(
                          "Today", Colors.white, ColorsConstants.primaryColor),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      list[0] = false;
                      list[1] = !list[1];
                      list[2] = false;
                      list[3] = false;
                    });
                  },
                  child: !list[1]
                      ? container("last weak", ColorsConstants.primaryColor,
                          Colors.white)
                      : container("last weak", Colors.white,
                          ColorsConstants.primaryColor),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      list[0] = false;
                      list[1] = false;
                      list[2] = !list[2];
                      list[3] = false;
                    });
                  },
                  child: !list[2]
                      ? container("last Month", ColorsConstants.primaryColor,
                          Colors.white)
                      : container("last Month", Colors.white,
                          ColorsConstants.primaryColor),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      list[0] = false;
                      list[1] = false;
                      list[2] = false;
                      list[3] = !list[3];
                    });
                  },
                  child: !list[3]
                      ? container(
                          "All", ColorsConstants.primaryColor, Colors.white)
                      : container(
                          "All", Colors.white, ColorsConstants.primaryColor),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

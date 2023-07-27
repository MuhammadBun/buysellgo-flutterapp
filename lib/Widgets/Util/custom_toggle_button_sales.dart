import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Core/Constants/my_colors.dart';
 

class ToggleButtonPostType extends StatefulWidget {
  const ToggleButtonPostType({super.key});

  @override
  _ToggleButtonPostTypeState createState() => _ToggleButtonPostTypeState();
}

class _ToggleButtonPostTypeState extends State<ToggleButtonPostType> {
  List list = [true, false];
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
          color: const Color.fromARGB(255, 25, 24, 24),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 5),
            child: Text(
              "Type",
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
                    });
                  },
                  child: !list[0]
                      ? container("Sales Offer", ColorsConstants.primaryColor,
                          Colors.white)
                      : container("Sales Offer", Colors.white,
                          ColorsConstants.primaryColor),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      list[0] = false;
                      list[1] = !list[1];
                    });
                  },
                  child: !list[1]
                      ? container("Buy Offers", ColorsConstants.primaryColor,
                          Colors.white)
                      : container("Buy Offers", Colors.white,
                          ColorsConstants.primaryColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

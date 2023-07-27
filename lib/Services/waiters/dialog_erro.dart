import 'package:buysellgo/Core/Constants/my_colors.dart';

import 'package:flutter/material.dart';

import '../../Core/Constants/my_fonts.dart';

class ShowDialogMessage {
  static openAnimatedUpdateDialog(
      BuildContext context, String title, String error) {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return Container();
      },
      transitionDuration: const Duration(milliseconds: 400),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
          child: FadeTransition(
            opacity: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              behavior: HitTestBehavior.opaque,
              child: Center(
                child: AlertDialog(
                  surfaceTintColor: ColorsConstants.primaryColor,
                  backgroundColor: ColorsConstants.primaryColor,
                  title: Container(
                    padding: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1, color: Colors.grey))),
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: FontsConstants.primaryFont,
                          fontSize: 18),
                    ),
                  ),
                  content: Container(
                    height: 50,
                    alignment: Alignment.topLeft,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorsConstants.primaryColor),
                      child: Text(
                        error,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: FontsConstants.primaryFont,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Back",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

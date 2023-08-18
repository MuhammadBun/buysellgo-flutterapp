import 'package:buysellgo/Core/Constants/text.dart';
import 'package:buysellgo/Widgets/Util/text_app.dart';

import 'package:flutter/material.dart';

import '../../Core/Constants/my_colors.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.primaryColor,
      body: Center(
        child: Container(padding: EdgeInsets.all(20),child: MainTextStyled(text: TextsConstants.verfiy)),
      ),
    );
  }
}

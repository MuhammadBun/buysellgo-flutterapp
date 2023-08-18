import 'package:buysellgo/Core/Constants/my_colors.dart';
import 'package:buysellgo/Widgets/Util/text_app.dart';
import 'package:flutter/material.dart';

class JoinUsButton extends StatelessWidget {
  const JoinUsButton(
      {super.key,
      required this.icon,
      required this.text,
      required this.onTap,
      required this.isActive});
  final Widget icon;
  final String text;
  final Function()? onTap;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: isActive
                ? Colors.white
                : Colors.grey.withOpacity(0.1),
            boxShadow: const [],
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(
              width: 12,
            ),
            MainTextStyled(text: text)
          ],
        ),
      ),
    );
  }
}

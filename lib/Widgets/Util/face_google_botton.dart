import 'package:buysellgo/Core/Constants/my_colors.dart';
import 'package:buysellgo/Widgets/Util/text_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FacebookGoogleButton extends StatelessWidget {
  const FacebookGoogleButton(
      {super.key, required this.url, required this.text, required this.onTap});
  final String url;
  final String text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 60, 60, 60),
           
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              url,
              color: Colors.white,
              width: 20,
            ),
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

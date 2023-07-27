import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconActiveWidget extends StatelessWidget {
  const IconActiveWidget({super.key, required this.path, this.function});
  final String path;
  final Function()? function;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
            borderRadius: BorderRadius.circular(10),
            splashColor: Colors.grey.withOpacity(0.3),
            onTap: function,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(path, width: 20,color: Colors.white,),
            )));
  }
}

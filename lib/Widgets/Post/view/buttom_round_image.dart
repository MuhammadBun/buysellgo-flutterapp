import 'package:flutter/cupertino.dart';

import 'buttom_round_clipper.dart';

class BottomRoundedImage extends StatelessWidget {
  final String imageUrl;
  final double radius;

  const BottomRoundedImage({
    Key? key,
    required this.imageUrl,
    this.radius = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomRoundedClipper(radius: radius),
      child: Image.network(imageUrl, fit: BoxFit.contain),
    );
  }
}

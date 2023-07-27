import 'package:flutter/cupertino.dart';

class BottomRoundedClipper extends CustomClipper<Path> {
  final double radius;

  BottomRoundedClipper({this.radius = 50});

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - radius);
    path.quadraticBezierTo(
        size.width / 2, size.height + radius, size.width, size.height - radius);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

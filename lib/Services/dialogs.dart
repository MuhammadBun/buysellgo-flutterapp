import 'dart:ui';

import 'package:buysellgo/Core/Constants/my_colors.dart';
import 'package:buysellgo/Core/Constants/my_fonts.dart';
import 'package:flutter/material.dart';

class AnimatedErrorContainer extends StatefulWidget {
  final String errorMessage;

  const AnimatedErrorContainer({Key? key, required this.errorMessage})
      : super(key: key);

  @override
  _AnimatedErrorContainerState createState() => _AnimatedErrorContainerState();
}

class _AnimatedErrorContainerState extends State<AnimatedErrorContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: const Offset(0.0, 0.1),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        margin: EdgeInsets.only(
            right: 20,
            left: 20,
            bottom: MediaQuery.of(context).size.height * 0.9),
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            widget.errorMessage,
            style: TextStyle(
              color: Colors.white,
              fontFamily: FontsConstants.primaryFont,
            ),
          ),
        ),  
      ),
    );
  }
}

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
      end: const Offset(
          0.0, 0.05), // Change this value to move the container further down
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
        width: 200,
        height: 300,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(
            right: 20,
            left: 20,
            bottom: MediaQuery.of(context).size.height * 0.80),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Error",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: FontsConstants.primaryFont,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.close,
                        color: Colors.black,
                        size: 20,
                      )),
                ],
              ),
              Text(
                widget.errorMessage,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: FontsConstants.primaryFont,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

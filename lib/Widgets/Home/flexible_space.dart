import 'package:flutter/material.dart';

import '../../Core/Constants/my_colors.dart';
import '../../Core/Constants/text.dart';
import '../Util/text_app.dart';

class FlexibleSpaceWidget extends StatefulWidget {
  const FlexibleSpaceWidget(
      {super.key, required this.sellFunction, required this.buyFunction});
  final dynamic sellFunction;
  final dynamic buyFunction;
  @override
  State<FlexibleSpaceWidget> createState() => _FlexibleSpaceWidgetState();
}

class _FlexibleSpaceWidgetState extends State<FlexibleSpaceWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _animation1;
  late Animation<Color?> _animation2;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isFirstContainerRed = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animation1 = ColorTween(
      begin: Colors.transparent,
      end: ColorsConstants.primaryColor,
    ).animate(
      _controller,
    );
    _animation2 = ColorTween(
      begin: ColorsConstants.primaryColor,
      end: Colors.transparent,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isFirstContainerRed = !_isFirstContainerRed;
      if (_isFirstContainerRed) {
        _controller.reverse();
        print(widget.sellFunction);
      } else {
        _controller.forward();
        widget.buyFunction;
      }
    });
  }

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Container(
        clipBehavior: Clip.hardEdge,
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.13,
            bottom: MediaQuery.of(context).size.height * 0.02,
            left: 60,
            right: 60),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 57, 57, 57),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: _handleTap,
              child: AnimatedBuilder(
                animation: _animation1,
                builder: (context, child) => Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: _animation1.value,
                  ),
                  width: 100,
                  height: 30,
                  child: MainTextStyled(text: TextsConstants.buyOption),
                ),
              ),
            ),
            Container(
              width: 1,
              height: 20,
              color: Colors.grey,
            ),
            GestureDetector(
              onTap: _handleTap,
              child: AnimatedBuilder(
                animation: _animation2,
                builder: (context, child) => Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: _animation2.value,
                  ),
                  child: MainTextStyled(text: TextsConstants.sellOption),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

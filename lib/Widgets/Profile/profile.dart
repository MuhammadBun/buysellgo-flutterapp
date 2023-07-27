import 'package:buysellgo/Core/Constants/my_colors.dart';
import 'package:buysellgo/Widgets/Post/card/card.dart';

import 'package:buysellgo/Widgets/Profile/flex_widget.dart';
import 'package:buysellgo/Widgets/Profile/title_widget.dart';

import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ScrollController _scrollController;
  bool _showTitle = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.offset > 300 && !_showTitle) {
          setState(() {
            _showTitle = true;
          });
        } else if ((_scrollController.offset <= 200 ||
                _scrollController.offset <= 00) &&
            _showTitle) {
          setState(() {
            _showTitle = false;
          });
        }
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ColorsConstants.primaryColor,
          foregroundColor: ColorsConstants.primaryColor,
          surfaceTintColor: ColorsConstants.primaryColor,
          pinned: true,
          title: TitleProfileWidget(
              callNow: () {}, editProfile: () {}, messageNow: () {}),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          expandedHeight: MediaQuery.of(context).size.height * 0.4,
          flexibleSpace: FlexProfileWidget(showTitle: _showTitle),
        ),
        SliverAnimatedList(
          initialItemCount: 20,
          itemBuilder: (context, index, animation) {
            return PostCardWidget();
          },
        )
      ],
    );
  }
}

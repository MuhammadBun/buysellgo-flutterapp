import 'dart:ui';

import 'package:buysellgo/Core/Constants/images_path.dart';
import 'package:buysellgo/Core/Constants/my_colors.dart';

import 'package:buysellgo/test_comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'blur_image.dart';

class FullPost extends StatefulWidget {
  const FullPost({super.key});

  @override
  State<FullPost> createState() => _FullPostState();
}

class _FullPostState extends State<FullPost> {
  final List<String> images = [
    'https://i.pinimg.com/236x/f7/4b/07/f74b07353db9ab3c69c2340b4eeb7ad4.jpg',
    'https://i.pinimg.com/236x/27/73/ed/2773edf66beb79a68873b5c86a0bf09b.jpg',
    'https://i.pinimg.com/236x/d9/ad/df/d9addfb1e2c47f2d031fe314d734d8b5.jpg',
    "https://i.pinimg.com/236x/1f/1f/c3/1f1fc322155dc7fe6ebd3c8d35d355da.jpg"
  ];
  int comIndex = 0;
  final PageController _controller = PageController(initialPage: 0);
  int _currentPage = 0;
  late ScrollController _scrollController;
  bool _showTitle = true;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!.round();
      });
    });
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.offset < 50) {
          setState(() {
            _showTitle = true;
          });
        } else if (_scrollController.offset > 90) {
          setState(() {
            _showTitle = false;
          });
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.primaryColor,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
              leading: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              automaticallyImplyLeading: false,
              pinned: true,
              expandedHeight: MediaQuery.of(context).size.height * 0.55,
              backgroundColor: ColorsConstants.primaryColor,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                      decoration: BoxDecoration(
                        color: ColorsConstants.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: _showTitle
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: PageView.builder(
                                controller: _controller,
                                itemCount: images.length,
                                itemBuilder: (context, index) {
                                  return InteractiveViewer(
                                      child: BlurredBackgroundImage(
                                          imageUrl: images[index]));
                                },
                              ),
                            )
                          : Container(),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 28, 28, 28),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(images.length, (index) {
                          return Row(
                            children: [
                              Container(
                                width: 60,
                                height: 3,
                                decoration: BoxDecoration(
                                    color: _currentPage == index
                                        ? Colors.amber
                                        : Colors.grey,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              SizedBox(width: 5)
                            ],
                          );
                        }),
                      ),
                    ),
                  ],
                ),
                expandedTitleScale: 1,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 81, 80, 80),
                          borderRadius: BorderRadius.circular(10)),
                      child: SvgPicture.asset(
                        AssetsImageData.saveImage,
                        width: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 81, 80, 80),
                          borderRadius: BorderRadius.circular(10)),
                      child: SvgPicture.asset(
                        AssetsImageData.messageImage,
                        width: 20,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.call,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              )),
          SliverAnimatedList(
            initialItemCount: 2,
            itemBuilder: (context, index, animation) {
              return CommentReplyWidget();
            },
          )
        ],
      ),
    );
  }
}

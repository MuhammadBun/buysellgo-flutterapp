import 'package:buysellgo/Core/Constants/images_path.dart';
import 'package:buysellgo/Core/Constants/my_colors.dart';
import 'package:buysellgo/Core/Constants/text.dart';
import 'package:buysellgo/Widgets/Home/drawer.dart';
import 'package:buysellgo/Widgets/Home/flexible_space.dart';
import 'package:buysellgo/Widgets/Home/icon_active.dart';

import 'package:buysellgo/Widgets/Post/card/card.dart';
import 'package:buysellgo/Widgets/Post/view/show_full_post.dart';

import 'package:buysellgo/Widgets/Util/text_app.dart';

import 'package:flutter/material.dart';

import '../Post/add/add_post.dart';
import '../Post/view/slid_to_add_post.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  getName() {
    print("name");
  }

  @override
  void initState() {
    super.initState();
  }

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 81, 81, 81),
      key: _scaffoldKey,
      drawer: DrawerWidget(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              pinned: true,
              expandedHeight: MediaQuery.of(context).size.height * 0.17,
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.only(
              //         bottomRight: Radius.circular(30),
              //         bottomLeft: Radius.circular(30))),
              automaticallyImplyLeading: false,
              stretch: true,
              floating: true,
              backgroundColor: ColorsConstants.primaryColor,
              foregroundColor: ColorsConstants.primaryColor,
              surfaceTintColor: ColorsConstants.primaryColor,
              title: Row(
                children: [
                  IconActiveWidget(
                    path: AssetsImageData.menuImage,
                    function: () {
                      _openDrawer();
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: MainTextStyled(text: TextsConstants.logoText),
                  )
                ],
              ),
              actions: [
                IconActiveWidget(
                  path: AssetsImageData.searchImage,
                  function: () {},
                ),
                Stack(
                  children: [
                    IconActiveWidget(
                      path: AssetsImageData.notificationImage,
                      function: () {},
                    ),
                    Positioned(
                      left: 20,
                      top: 10,
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    IconActiveWidget(
                      path: AssetsImageData.messageImage,
                      function: () {},
                    ),
                    Positioned(
                      left: 20,
                      top: 10,
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ],
                ),
              ],
              flexibleSpace: FlexibleSpaceWidget(
                buyFunction: getName(),
                sellFunction: getName(),
              )),
          SliverAnimatedList(
            initialItemCount: 20,
            itemBuilder: (context, index, animation) {
              return GestureDetector(
                child: PostCardWidget(),
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          SlidUpShowPostWidget(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        final begin = Offset(0.0, 1.0);
                        final end = Offset.zero;
                        final curve = Curves.ease;

                        final tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));
                        final offsetAnimation = animation.drive(tween);

                        return SlideTransition(
                          position: offsetAnimation,
                          child: FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 80),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    AddPost(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  final begin = Offset(0.0, 1.0);
                  final end = Offset.zero;
                  final curve = Curves.ease;

                  final tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  final offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  );
                },
              ),
            );
          },
          child: Icon(
            Icons.edit,
            color: Colors.white,
          ),
          backgroundColor: ColorsConstants.primaryColor,
        ),
      ),
    );
  }
}

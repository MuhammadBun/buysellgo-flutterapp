import 'package:buysellgo/Core/Constants/my_colors.dart';
import 'package:buysellgo/Widgets/Post/add/show_menu.dart';
import 'package:buysellgo/Widgets/Post/add/slid_up.dart';
 
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  late TextEditingController postController;

  @override
  void initState() {
    postController = TextEditingController();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorsConstants.primaryColor,
    ));
    super.initState();
  }

  @override
  void dispose() {
    postController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 69, 68, 68),
          appBar: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: ColorsConstants.primaryColor,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                )),
            title: const Text(
              "Create Post",
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.all(10),
                child: MaterialButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: const Color.fromARGB(255, 87, 86, 86),
                  child: const Text(
                    "Post",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          body: SlidUpWidget(
            postController: postController,
          )),
      onWillPop: () async {
        if (postController.text.isEmpty) {
          return true;
        } else {
          return ShowMenu.showMenu(context);
        }
      },
    );
  }
}

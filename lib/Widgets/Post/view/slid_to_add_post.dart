import 'package:buysellgo/Core/Constants/my_colors.dart';
import 'package:buysellgo/Core/Constants/my_fonts.dart';
import 'package:buysellgo/Widgets/Post/view/show_full_post.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SlidUpShowPostWidget extends StatefulWidget {
  const SlidUpShowPostWidget({super.key});

  @override
  State<SlidUpShowPostWidget> createState() => _SlidUpShowPostWidgetState();
}

class _SlidUpShowPostWidgetState extends State<SlidUpShowPostWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(30)),
        margin: const EdgeInsets.only(top: 300),
        defaultPanelState: PanelState.CLOSED,
        color: const Color.fromARGB(255, 20, 20, 20),
        maxHeight: MediaQuery.of(context).size.height,
        panel: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Icon(
                  Icons.keyboard_arrow_up_sharp,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Row(
                  children: [
                    Text(
                      'Description',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: FontsConstants.primaryFont,
                          fontSize: 24),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.lightbulb,
                      color: const Color.fromARGB(255, 226, 207, 136),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 41, 41, 41),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  'The Samsung Galaxy Note 10 Plus is a powerful smartphone with a large 6.8-inch AMOLED display and a high pixel density of 498ppi 1. It has a Snapdragon 855 8-core processor, 12GB of RAM, and comes with either 256GB or 512GB of internal storage 2. The device also features a quad-camera setup with a 12MP main camera, and supports ultra-fast 45W wired charging and 20W wireless charging for its 4,300mAh battery 2. The phone was released in August 2019 2.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        body: FullPost(),
      ),
    );
  }
}

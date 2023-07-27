import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Core/Constants/my_colors.dart';
import '../../Core/Constants/my_fonts.dart';

class FlexProfileWidget extends StatefulWidget {
  const FlexProfileWidget({super.key, required this.showTitle});
  final bool showTitle;
  @override
  State<FlexProfileWidget> createState() => _FlexProfileWidgetState();
}

class _FlexProfileWidgetState extends State<FlexProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      title: widget.showTitle
          ? Text(
              "Muhammad",
              style: TextStyle(fontSize: 16),
            )
          : null,
      stretchModes: [],
      centerTitle: true,
      collapseMode: CollapseMode.parallax,
      background: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(
          color: ColorsConstants.primaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                      color: Color.fromARGB(255, 73, 73, 73), width: 5)),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHDRlp-KGr_M94k_oor4Odjn2UzbAS7n1YoA&usqp=CAU'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Muhammad Hamad",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: FontsConstants.primaryFont),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 73, 73, 73),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color.fromARGB(255, 73, 73, 73))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Rate",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: FontsConstants.primaryFont,
                            fontSize: 16),
                      ),
                      Text(
                        "4.3",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w200,
                            fontSize: 16),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        "Posts",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: FontsConstants.primaryFont,
                            fontSize: 16),
                      ),
                      Text(
                        "14",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w200,
                            fontSize: 16),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        "Phone Number",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: FontsConstants.primaryFont,
                            fontSize: 16),
                      ),
                      Container(
                        child: InkWell(
                          onTap: () {
                            Clipboard.setData(ClipboardData(text: ""));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Copied to clipboard'),
                                backgroundColor: ColorsConstants.primaryColor,
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Text(
                                "0598881234",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200,
                                    fontSize: 16),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.copy,
                                size: 15,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

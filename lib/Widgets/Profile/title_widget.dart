import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Core/Constants/images_path.dart';
import '../../Core/Constants/my_fonts.dart';

class TitleProfileWidget extends StatelessWidget {
  const TitleProfileWidget(
      {super.key,
      required this.callNow,
      required this.editProfile,
      required this.messageNow});
  final Function()? callNow;
  final Function()? messageNow;
  final Function()? editProfile;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Color.fromARGB(42, 87, 233, 84),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: callNow,
                      child: Text(
                        'Call Now',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.green,
                            fontFamily: FontsConstants.primaryFont),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Icon(
                      Icons.phone,
                      color: Colors.green,
                      size: 14,
                    )
                  ],
                )
              ],
            )),
        Row(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 73, 73, 73),
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    splashColor: Colors.grey.withOpacity(0.3),
                    onTap: messageNow,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        AssetsImageData.messageImage,
                        width: 20,
                        color: Colors.white,
                      ),
                    ))),
            SizedBox(
              width: 10,
            ),
            Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 73, 73, 73),
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    splashColor: Colors.grey,
                    onTap: editProfile,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 20,
                      ),
                    ))),
          ],
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../Core/Constants/my_fonts.dart';

class ShowImageDescription extends StatelessWidget {
  const ShowImageDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: FontsConstants.primaryFont,
                    fontSize: 14),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 41, 41, 41),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  'The Samsung Galaxy Note 10 Plus is a powerful smartphone with a large 6.8-inch AMOLED display and a high pixel density of 498ppi 1. It has a Snapdragon 855 8-core processor, 12GB of RAM, and comes with either 256GB or 512GB of internal storage 2. The device also features a quad-camera setup with a 12MP main camera, and supports ultra-fast 45W wired charging and 20W wireless charging for its 4,300mAh battery 2. The phone was released in August 2019 2.',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: FontsConstants.primaryFont,
                      fontSize: 14),
                  textAlign: TextAlign.justify,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmtuDbAGR1wYwm1y5GRU7szFdbbnDGPv5sdg&usqp=CAU',
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.85)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "See More Details +",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: FontsConstants.primaryFont),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

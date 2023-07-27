import 'package:buysellgo/Core/Constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavigationBarWidget({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style = GoogleFonts.aBeeZee(color: Colors.white);
    return Container(
      color: ColorsConstants.primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: GNav(
            selectedIndex: selectedIndex,
            activeColor: Colors.white,
            backgroundColor: ColorsConstants.primaryColor,
            tabBackgroundColor:
                Color.fromARGB(255, 141, 141, 141).withOpacity(0.15),
            color: Color(0xFFBDBDBD),
            padding: EdgeInsets.all(4),
            gap: 8,
            tabs: [
              GButton(
                padding:
                    EdgeInsets.only(left: 30, top: 10, bottom: 10, right: 8),
                icon: Icons.home,
                iconSize: 25,
                textStyle: style,
                text: "Home",
                onPressed: () {
                  onItemTapped(0);
                },
              ),
              GButton(
                padding:
                    EdgeInsets.only(left: 30, top: 10, bottom: 10, right: 8),
                icon: Icons.person,
                iconSize: 25,
                text: "Profile",
                textStyle: style,
                onPressed: () {
                  onItemTapped(1);
                },
              ),
              GButton(
                padding:
                    EdgeInsets.only(left: 30, top: 10, bottom: 10, right: 8),
                icon: Icons.groups_2,
                iconSize: 25,
                text: "Communities",
                textStyle: style,
                onPressed: () {
                  onItemTapped(2);
                },
              ),
              GButton(
                padding:
                    EdgeInsets.only(left: 30, top: 10, bottom: 10, right: 8),
                icon: Icons.settings,
                iconSize: 25,
                text: "Settings",
                textStyle: style,
                onPressed: () {
                  onItemTapped(3);
                },
              ),
            ]),
      ),
    );
  }
}

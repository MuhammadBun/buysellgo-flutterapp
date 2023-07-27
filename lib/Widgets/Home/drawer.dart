import 'package:flutter/material.dart';

import '../../Core/Constants/my_colors.dart';
import '../Util/custom_toggle.dart';
import '../Util/custom_toggle_button_sales.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        decoration: const BoxDecoration(
          color: ColorsConstants.primaryColor,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
            ),
            const ToggleButtonDate(),
            const SizedBox(
              height: 10,
            ),
            const ToggleButtonPostType(),
            const SizedBox(
              height: 10,
            ),
            const ToggleButtonDate(),
            const SizedBox(
              height: 10,
            ),
            const ToggleButtonDate(),
          ],
        ),
      ),
    );
  }
}

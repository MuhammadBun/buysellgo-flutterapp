import 'package:buysellgo/Core/Constants/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../Core/Constants/my_colors.dart';
 

class SlidUpWidget extends StatefulWidget {
  const SlidUpWidget({super.key, required this.postController});
  final TextEditingController postController;

  @override
  State<SlidUpWidget> createState() => _SlidUpWidgetState();
}

class _SlidUpWidgetState extends State<SlidUpWidget> {
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      margin: const EdgeInsets.only(top: 300),
      defaultPanelState: PanelState.OPEN,
      color: ColorsConstants.primaryColor,
      maxHeight: MediaQuery.of(context).size.height,
      panel: Column(
        children: [
          Container(
              decoration: const BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: Colors.grey, width: 1))),
              child: const ListTile(
                title:
                    Text("Add Photos", style: TextStyle(color: Colors.white)),
                leading: Icon(
                  Icons.photo,
                  color: Colors.green,
                ),
                minLeadingWidth: 5,
              )),
          Column(
            children: [
              Row(
                children: [
                  Radio(
                    value: 0,
                    groupValue: 0,
                    onChanged: (value) {},
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text("Sell", style: TextStyle(color: Colors.white))
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: 1,
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text("Buy", style: TextStyle(color: Colors.white))
                ],
              )
            ],
          ),
        ],
      ),
      body: TextFormField(
        style: const TextStyle(
            fontSize: 16,
            fontFamily: FontsConstants.primaryFont,
            color: Colors.white),
        controller: widget.postController,
        onChanged: (value) async {},
        validator: (text) {
          if (text!.isEmpty) {
            return "null";
          }
          return null;
        },
        cursorColor: Colors.grey,
        maxLines: 100,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(30),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            hintText: "Tap Here",
            hintStyle: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.grey.withOpacity(0.4)),
            border: InputBorder.none),
        keyboardType: TextInputType.multiline,
      ),
    );
  }
}

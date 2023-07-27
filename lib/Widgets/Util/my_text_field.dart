import 'package:buysellgo/Core/Constants/my_colors.dart';
import 'package:buysellgo/Core/Constants/my_fonts.dart';
import 'package:flutter/material.dart';

class TextFormFieldForApp extends StatelessWidget {
  const TextFormFieldForApp(
      {super.key,
      required this.controller,
      required this.hintText,
      this.isAccepted,
      this.function,
      required this.focusNode,
      this.onFieldSubmitted});
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? function;
  final bool? isAccepted;
  final FocusNode focusNode;
  final Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide:
                    const BorderSide(width: 2, color: Colors.transparent)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide:
                    const BorderSide(width: 2, color: Colors.transparent)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide:
                    const BorderSide(width: 2, color: Colors.transparent)),
            contentPadding: const EdgeInsets.all(15),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide:
                    const BorderSide(width: 2, color: Colors.transparent)),
            fillColor: Colors.grey.withOpacity(0.1),
            filled: true,
            hintText: hintText,
            suffixIcon: isAccepted ?? false
                ? const Icon(
                    Icons.check_circle,
                    size: 20,
                    color: Colors.green,
                  )
                : null,
            hintStyle: const TextStyle(
                color: Color.fromARGB(131, 199, 201, 203),
                fontFamily: FontsConstants.primaryFont)),
        onTap: () {},
        keyboardType: TextInputType.emailAddress,
        validator: function,
        style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontFamily: FontsConstants.primaryFont),
        focusNode: focusNode,
        cursorColor: ColorsConstants.primaryColor,
      ),
    );
  }
}

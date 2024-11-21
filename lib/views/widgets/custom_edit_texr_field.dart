import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomEditTextField extends StatelessWidget {
  const CustomEditTextField(
      {super.key,
      this.text,
      this.maxLines = 1,
      this.onChanged,
      required this.color,
      required this.fontSize,
      this.controller});

  final String? text;
  final int maxLines;
  final Function(String?)? onChanged;
  final Color color;
  final double fontSize;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      style: TextStyle(
        fontSize: fontSize,
      ),
      /////////////////////////////////////////////
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        fillColor: color,
        filled: true,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(
          kSecondaryColor,
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide.none,
    );
  }
}

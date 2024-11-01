import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomEditTextField extends StatelessWidget {
  const CustomEditTextField({
    super.key,
    this.text,
    this.maxLines = 1,
    this.onChanged,
    required this.color,
  });

  final String? text;
  final int maxLines;
  final Function(String?)? onChanged;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(text: text);
    return TextFormField(
      controller: controller, /////////////////////////////////////////////
      cursorColor: kSecondaryColor,
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

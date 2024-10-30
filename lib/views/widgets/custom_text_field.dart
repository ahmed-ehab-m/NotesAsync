import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.text,
      this.maxLines = 1,
      this.onSaved,
      this.onChanged,
      this.onPressedSearch,
      this.showIcon = false});

  final String text;
  final int maxLines;
  final void Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final void Function()? onPressedSearch;
  final bool showIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: false, /////////////////////////////////////////////
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is Required';
        } else {
          return null;
        }
      },
      cursorColor: kSecondaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        prefixIcon: showIcon
            ? IconButton(
                onPressed: onPressedSearch, icon: Icon(CupertinoIcons.search))
            : null,
        hintText: text,
        hintStyle: const TextStyle(color: kSecondaryColor),
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
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ),
    );
  }
}

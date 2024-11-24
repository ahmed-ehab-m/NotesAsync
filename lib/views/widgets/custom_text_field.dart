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
      this.showIcon = false,
      this.autofocus = false,
      this.fontSize,
      this.color});

  final String text;
  final int maxLines;
  final void Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final void Function()? onPressedSearch;
  final bool showIcon;
  final bool autofocus;
  final double? fontSize;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
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
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        fillColor: color,
        // fillColor: color == null ??
        //         BlocProvider.of<ChangeThemeCubit>(context).theme ==
        //             Brightness.light
        //     ? Colors.grey[500]!.withOpacity(0.3)
        //     : Color(0x1A9E9E9E),
        filled: true,
        prefixIcon: showIcon
            ? IconButton(
                onPressed: onPressedSearch, icon: Icon(CupertinoIcons.search))
            : null,
        hintText: text,
        hintStyle: TextStyle(fontSize: fontSize ?? 16),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/change%20font%20size%20cubit/change_font_size_cubit.dart';
import 'package:notes_app/cubits/change%20font%20size%20cubit/change_font_size_state.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.text,
      this.validator,
      this.maxLines = 1,
      this.onSaved,
      this.onChanged,
      this.onPressedSearch,
      this.showIcon = false,
      // this.autofocus = false,
      this.fontSize,
      this.color,
      this.focusNode});

  final String text;
  final int maxLines;
  final void Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final void Function()? onPressedSearch;
  final bool showIcon;
  // final bool autofocus;
  final double? fontSize;
  final Color? color;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeFontSizeCubit, ChangeFontSizeState>(
      builder: (context, state) {
        return TextFormField(
          style: TextStyle(fontSize: fontSize),
          autofocus: false,
          // autofocus: autofocus,
          focusNode: focusNode,
          readOnly: false, /////////////////////////////////////////////
          onChanged: onChanged,
          onSaved: onSaved,
          validator: validator,
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
                    onPressed: onPressedSearch,
                    icon: Icon(CupertinoIcons.search))
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
      },
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide.none,
    );
  }
}

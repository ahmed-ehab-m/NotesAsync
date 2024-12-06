import 'package:Notes/constants.dart';
import 'package:Notes/cubits/change%20font%20size%20cubit/change_font_size_cubit.dart';
import 'package:Notes/cubits/change%20font%20size%20cubit/change_font_size_state.dart';
import 'package:Notes/helper/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      this.focusNode,
      this.controller});

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
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeFontSizeCubit, ChangeFontSizeState>(
      builder: (context, state) {
        return TextFormField(
          controller: controller,
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
            filled: true,
            prefixIcon: showIcon
                ? IconButton(
                    onPressed: onPressedSearch,
                    icon: Icon(CupertinoIcons.search))
                : null,
            hintText: text,
            hintStyle:
                TextStyle(fontSize: fontSize ?? ResponsiveSpacing.fontSize(16)),
            border: buildBorder(),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder(Colors.grey),
          ),
        );
      },
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(ResponsiveSpacing.value(15)),
      borderSide: BorderSide.none,
    );
  }
}

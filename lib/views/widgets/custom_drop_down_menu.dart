import 'package:Notes/cubits/change%20theme%20cubit/change_theme_cubit.dart';
import 'package:Notes/helper/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDropdownMenu extends StatelessWidget {
  const CustomDropdownMenu({
    super.key,
    required this.firstOption,
    required this.secondOption,
    this.thridption,
    this.fourthOption,
    required this.initialSelection,
    this.onSelected,
  });
  final String firstOption;
  final String secondOption;
  final String? thridption;
  final String? fourthOption;
  final int initialSelection;
  final void Function(dynamic)? onSelected;
  @override
  Widget build(BuildContext context) {
    Color? color = BlocProvider.of<ChangeThemeCubit>(context).backgroundColor ==
            Colors.black
        ? Colors.white
        : Colors.black;
    return DropdownMenu(
      onSelected: onSelected,
      textAlign: TextAlign.end,
      inputDecorationTheme: InputDecorationTheme(border: InputBorder.none),
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      menuStyle: MenuStyle(
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(ResponsiveSpacing.value(20))))),
      width: 200,
      initialSelection: initialSelection,
      dropdownMenuEntries: [
        DropdownMenuEntry(
            value: 1, label: firstOption, style: buttonStyle(1, color)),
        DropdownMenuEntry(
            value: 2, label: secondOption, style: buttonStyle(2, color)),
        if (thridption != null)
          DropdownMenuEntry(
              value: 3, label: thridption!, style: buttonStyle(3, color)),
        if (fourthOption != null)
          DropdownMenuEntry(
              value: 4, label: fourthOption!, style: buttonStyle(4, color)),
      ],
    );
  }

  ButtonStyle buttonStyle(int value, Color? color) {
    return ButtonStyle(
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ResponsiveSpacing.value(10)))),
      textStyle: WidgetStatePropertyAll(
        TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: ResponsiveSpacing.fontSize(18)),
      ),
      backgroundColor: WidgetStateProperty.all(
        value == initialSelection ? Colors.blue.withOpacity(0.3) : null,
      ),
      foregroundColor: WidgetStateProperty.all(
        value == initialSelection ? Colors.blue : color,
      ),
    );
  }
}

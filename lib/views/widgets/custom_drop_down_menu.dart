import 'package:flutter/material.dart';

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
    return DropdownMenu(
      onSelected: onSelected,
      textAlign: TextAlign.end,
      inputDecorationTheme: InputDecorationTheme(border: InputBorder.none),
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      menuStyle: MenuStyle(
          shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
      width: 200,
      initialSelection: initialSelection,
      dropdownMenuEntries: [
        DropdownMenuEntry(value: 1, label: firstOption, style: buttonStyle(1)),
        DropdownMenuEntry(value: 2, label: secondOption, style: buttonStyle(2)),
        if (thridption != null)
          DropdownMenuEntry(
              value: 3, label: thridption!, style: buttonStyle(3)),
        if (fourthOption != null)
          DropdownMenuEntry(
              value: 4, label: fourthOption!, style: buttonStyle(4)),
      ],
    );
  }

  ButtonStyle buttonStyle(int value) {
    return ButtonStyle(
      textStyle: const WidgetStatePropertyAll(
        TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      backgroundColor: WidgetStateProperty.all(
        value == initialSelection ? Colors.blue.withOpacity(0.3) : null,
      ),
      foregroundColor: WidgetStateProperty.all(
        value == initialSelection ? Colors.blue : null,
      ),
    );
  }
}

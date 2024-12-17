import 'package:Notes/constants.dart';
import 'package:flutter/material.dart';
import 'package:pie_menu/pie_menu.dart';

class PieThNoteeme {
  static PieTheme pieTheme(BuildContext context, int color) {
    return PieTheme(
        tooltipTextStyle: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black),
        pointerColor: Color(color),
        overlayColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.black.withAlpha(200)
            : Colors.white.withAlpha(200),
        buttonThemeHovered: const PieButtonTheme(
            backgroundColor: kPrimaryColor, iconColor: Colors.white),
        buttonTheme: const PieButtonTheme(
            backgroundColor: Colors.white, iconColor: kPrimaryColor));
  }
}

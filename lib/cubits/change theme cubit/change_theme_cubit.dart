import 'package:Notes/constants.dart';
import 'package:Notes/cubits/change%20theme%20cubit/change_theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit() : super(ChangeThemeInitial()) {
    loadTheme();
    emit(ChangeThemeSuccess());
  }
  final hour = DateTime.now().hour;

  Brightness theme = Brightness.dark;
  Color? backgroundColor = Colors.white;
  Color circleColor = kPrimaryColor;
  Brightness defaultTheme() {
    if (hour >= 5 && hour < 17) {
      backgroundColor = Colors.white;
      circleColor = kPrimaryColor;
      return Brightness.light;
    } else {
      circleColor = kPrimaryColor;
      backgroundColor = Colors.black;
      return Brightness.dark;
    }
  }

  Future loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getInt(KThemeKey) ?? 3;
    changeTheme(savedTheme, save: false);
  }

  changeTheme(int themeType, {bool save = true}) async {
    switch (themeType) {
      case 1:
        theme = Brightness.light;
        backgroundColor = Colors.white;
        circleColor = kPrimaryColor;
        break;
      case 2:
        theme = Brightness.dark;
        backgroundColor = Colors.black;
        circleColor = kPrimaryColor;
        break;
      case 3:
        theme = defaultTheme();

        break;
    }
    emit(ChangeThemeSuccess());
    if (save) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(KThemeKey, themeType);
    }
  }
}

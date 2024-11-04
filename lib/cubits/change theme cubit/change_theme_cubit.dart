import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/change%20theme%20cubit/change_theme_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit() : super(ChangeThemeInitial()) {
    loadTheme();
    emit(ChangeThemeSuccess());
  }
  final hour = DateTime.now().hour;
  Color color = Colors.white;
  Brightness theme = Brightness.dark;

  Brightness defaultTheme() {
    return hour >= 5 && hour < 18 ? Brightness.light : Brightness.dark;
  }

  Color defaultColor() {
    return hour >= 5 && hour < 18 ? Colors.grey : Colors.white;
  }

  Future loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getInt('themeType') ?? 3;
    changeTheme(savedTheme, save: false);
  }

  changeTheme(int themeType, {bool save = true}) async {
    switch (themeType) {
      case 1:
        theme = Brightness.light;
        color = Colors.grey;
        break;
      case 2:
        theme = Brightness.dark;
        color = Colors.white;
        break;
      case 3:
        theme = defaultTheme();
        color = defaultColor();
        break;
    }
    emit(ChangeThemeSuccess());
    if (save) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('themeType', themeType);
    }
    // حفظ الثيم إذا كان مطلوبًا
  }
}

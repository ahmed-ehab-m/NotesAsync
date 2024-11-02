import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/change%20font%20size%20cubit/change_font_size_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeFontSizeCubit extends Cubit<ChangeFontSizeState> {
  ChangeFontSizeCubit() : super(ChangeFontSizeInitial()) {
    defaultFont();
  }

  double fontSize = 10;

  Future<void> defaultFont() async {
    final prefs = await SharedPreferences.getInstance();
    final savedFont = prefs.getInt('fontIndex') ?? 2;
    await changeFontSize(savedFont, save: false);
  }

  Future<void> changeFontSize(int fontNo, {bool save = true}) async {
    switch (fontNo) {
      case 1:
        fontSize = 10;
        break;
      case 2:
        fontSize = 20;
        break;
      case 3:
        fontSize = 30;
        break;
      case 4:
        fontSize = 40;
        break;
    }
    if (save) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('fontIndex', fontNo);
    }
    emit(ChangeFontSizeSuccess());
  }
}

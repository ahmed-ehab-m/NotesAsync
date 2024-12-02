import 'package:Notes/cubits/change%20font%20size%20cubit/change_font_size_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeFontSizeCubit extends Cubit<ChangeFontSizeState> {
  ChangeFontSizeCubit() : super(ChangeFontSizeInitial()) {
    defaultFont();
  }

  double titleFontSize = 15.sp;
  double contentFontSize = 10.sp;
  Future<void> defaultFont() async {
    final prefs = await SharedPreferences.getInstance();
    final savedFont = prefs.getInt('fontIndex') ?? 2;
    await changeFontSize(savedFont, save: false);
  }

  Future<void> changeFontSize(int fontNo, {bool save = true}) async {
    switch (fontNo) {
      case 1:
        titleFontSize = 15.sp;
        contentFontSize = 10.sp;
        break;
      case 2:
        titleFontSize = 25.sp;
        contentFontSize = 20.sp;
        break;
      case 3:
        titleFontSize = 35.sp;
        contentFontSize = 30.sp;
        break;
      case 4:
        titleFontSize = 45.sp;
        contentFontSize = 40.sp;
        break;
    }
    if (save) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('fontIndex', fontNo);
    }
    emit(ChangeFontSizeSuccess());
  }
}

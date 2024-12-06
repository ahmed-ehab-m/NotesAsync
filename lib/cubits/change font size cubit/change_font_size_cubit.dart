import 'package:Notes/constants.dart';
import 'package:Notes/cubits/change%20font%20size%20cubit/change_font_size_state.dart';
import 'package:Notes/helper/responsive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeFontSizeCubit extends Cubit<ChangeFontSizeState> {
  ChangeFontSizeCubit() : super(ChangeFontSizeInitial()) {
    defaultFont();
  }

  double titleFontSize = ResponsiveSpacing.fontSize(KFontSmallTitle);
  double contentFontSize = ResponsiveSpacing.fontSize(KFontSmallContent);
  Future<void> defaultFont() async {
    final prefs = await SharedPreferences.getInstance();
    final savedFont = prefs.getInt(KFontKey) ?? 2;
    await changeFontSize(savedFont, save: false);
  }

  Future<void> changeFontSize(int fontNo, {bool save = true}) async {
    switch (fontNo) {
      case 1:
        titleFontSize = ResponsiveSpacing.fontSize(KFontSmallTitle);
        contentFontSize = ResponsiveSpacing.fontSize(KFontSmallContent);
        break;
      case 2:
        titleFontSize = ResponsiveSpacing.fontSize(KFontMediumTitle);
        contentFontSize = ResponsiveSpacing.fontSize(KFontMediumContent);
        break;
      case 3:
        titleFontSize = ResponsiveSpacing.fontSize(KFontLargeTitle);
        contentFontSize = ResponsiveSpacing.fontSize(KFontLargeContent);
        break;
      case 4:
        titleFontSize = ResponsiveSpacing.fontSize(KFontHugeTitle);
        contentFontSize = ResponsiveSpacing.fontSize(KFontHugeContent);
        break;
    }
    if (save) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(KFontKey, fontNo);
    }
    emit(ChangeFontSizeSuccess());
  }
}

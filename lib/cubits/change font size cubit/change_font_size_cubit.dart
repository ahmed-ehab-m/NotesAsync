import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/change%20font%20size%20cubit/change_font_size_state.dart';

class ChangeFontSizeCubit extends Cubit<ChangeFontSizeState> {
  ChangeFontSizeCubit() : super(ChangeFontSizeInitial());
}

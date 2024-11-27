import 'package:Notes/constants.dart';
import 'package:Notes/cubits/notes%20cubit/notes_state.dart';
import 'package:Notes/models/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial()) {
    loadLayout();
    emit(NotesSuccess());
  }
  List<NoteModel>? notes;
  List<NoteModel>? filteredNotes;

  bool layout = false;
  changeLayout(int value) {
    value == 1 ? layout = true : layout = false;
  }

  Future loadLayout() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLayout = prefs.getInt('layoutIndex') ?? 1;
    changeLayout(savedLayout);
  }

  fetchAllNotes({String? pattern}) {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
    notes!.sort((a, b) {
      // فرز حسب pin ثم التاريخ
      int pinComparison = (b.pin ? 1 : 0) - (a.pin ? 1 : 0);
      if (pinComparison == 0) {
        return b.date.compareTo(a.date);
      }
      return pinComparison;
    });
    // notes!.reversed;
    if (pattern != null && pattern.isNotEmpty) {
      filteredNotes = notes?.where((note) {
        final titleLower = note.title.toLowerCase();
        final contentLower = note.subtitle.toLowerCase();
        final patternLower = pattern.toLowerCase();

        return titleLower.contains(patternLower) ||
            contentLower.contains(patternLower);
      }).toList();
    } else {
      filteredNotes = notes;
    }
    emit(NotesSuccess());
  }
}

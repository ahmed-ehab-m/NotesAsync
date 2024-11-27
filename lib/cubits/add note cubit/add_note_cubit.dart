import 'package:Notes/constants.dart';
import 'package:Notes/cubits/add%20note%20cubit/add_note_state.dart';
import 'package:Notes/models/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Color? color = Color(0x1A9E9E9E);
  addNote(NoteModel note) async {
    note.color = color!.value;
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);

      emit(AddNoteSuccess());
    } catch (e) {
      // TODO
      emit(AddNoteFailure(errorMessage: e.toString()));
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/pin%20_notes_cubit/pin_notes_state.dart';
import 'package:notes_app/models/note_model.dart';

class PinNotesCubit extends Cubit<PinNotesState> {
  PinNotesCubit() : super(PinNoteInitial());
  List<NoteModel> pinNotes = [];
  pinNote(NoteModel note) {
    note.pin = true;
    note.save();
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    pinNotes = notesBox.values.where((note) => note.pin = true).toList();
    emit(PinNoteSuccess());
  }
}

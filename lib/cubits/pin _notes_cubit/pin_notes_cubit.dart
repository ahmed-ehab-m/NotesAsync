import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/pin%20_notes_cubit/pin_notes_state.dart';
import 'package:notes_app/models/note_model.dart';

class PinNotesCubit extends Cubit<PinNotesState> {
  PinNotesCubit() : super(PinNoteInitial());
  List<NoteModel> pinNotes = [];
  pinNote(NoteModel note) {
    pinNotes.add(note);
    emit(PinNoteSuccess());
  }
}

class PinNotesState {}

class PinNoteInitial extends PinNotesState {}

class PinNoteLoading extends PinNotesState {}

class PinNoteSuccess extends PinNotesState {}

class PinNoteFailure extends PinNotesState {
  PinNoteFailure({required this.errorMessage});
  final String errorMessage;
}

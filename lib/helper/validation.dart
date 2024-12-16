import 'package:Notes/constants.dart';
import 'package:Notes/cubits/add%20note%20cubit/add_note_cubit.dart';
import 'package:Notes/cubits/notes%20cubit/notes_cubit.dart';
import 'package:Notes/models/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class Validation {
  static void formValidation(BuildContext context, GlobalKey<FormState> formKey,
      {String? title, String? content, Color? tfColor}) {
    var currnetDate = DateTime.now();
    var formattedCurrntDate = DateFormat('MMM dd hh:mm a').format(currnetDate);
    var noteModel = NoteModel(
      title: title == null || title.isEmpty ? 'Untitled' : title,
      subtitle: content!,
      date: formattedCurrntDate,
      color: tfColor?.value ?? kColors[0].value,
      pin: false,
    );
    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
  }

  static void editFormValidation(BuildContext context, NoteModel note,
      {String? title, String? content, Color? tfColor}) async {
    if (note.subtitle.isEmpty &&
        (note.title.isEmpty || note.title == 'Untitled')) {
      note.delete();
      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
      Navigator.pop(context);
    }
    note.title = title == null || title.isEmpty ? 'Untitled' : title;
    note.subtitle = content ?? note.subtitle;
    note.color = tfColor?.value ?? note.color;
    await note.save();
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    Navigator.pop(context);
  }
}

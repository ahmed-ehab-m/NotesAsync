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
    if ((title == null || title.isEmpty) &&
        (content == null || content.isEmpty)) {
      Navigator.pop(context);
      return;
    }
    var noteModel = NoteModel(
      title: title == null || title.isEmpty ? 'Untitled' : title,
      subtitle: content == null || content.isEmpty ? 'No Text' : content,
      date: formattedCurrntDate,
      color: tfColor?.value ?? kColors[0].value,
      pin: false,
    );
    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
  }

  static void editNoteFormValidation(BuildContext context,
      {NoteModel? noteModel,
      String? title,
      String? content,
      Color? tfColor}) async {
    String noteTitle() {
      if (title == null) {
        return noteModel!.title;
      }

      if (title!.isEmpty) {
        return 'Untitled';
      } else
        return title!;
    }

    String noteContent() {
      if (content == null) {
        return noteModel!.subtitle;
      }

      if (content!.isEmpty) {
        return 'No Text';
      } else
        return content!;
    }

    noteModel!.title = noteTitle();
    noteModel.subtitle = noteContent();
    noteModel.color = tfColor?.value ?? noteModel.color;
    if (noteModel.title == 'Untitled' && noteModel.subtitle == 'No Text') {
      noteModel.delete();
      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
      Navigator.pop(context);
      return;
    }
    await noteModel.save();
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    Navigator.pop(context);
  }
}

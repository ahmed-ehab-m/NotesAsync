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
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var currnetDate = DateTime.now();
      var formattedCurrntDate =
          DateFormat('MMM dd hh:mm a').format(currnetDate);
      var noteModel = NoteModel(
        title: title == null || title.isEmpty ? 'Untitled' : title,
        subtitle: content == null || content.isEmpty ? 'Untitled' : content,
        date: formattedCurrntDate,
        color: tfColor?.value ?? kColors[0].value,
        pin: false,
      );
      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    } else {
      // عرض SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please enter some data!'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}

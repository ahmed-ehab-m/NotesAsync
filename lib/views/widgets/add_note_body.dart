import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_app/cubits/notes%20cubit/notes_cubit.dart';
import 'package:notes_app/views/widgets/add_note_form.dart';
import 'package:notes_app/views/widgets/custom_snack_bar.dart';

class AddNoteBody extends StatelessWidget {
  const AddNoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteFailure) {
          print('failed ${state.errorMessage}');
        }
        if (state is AddNoteSuccess) {
          BlocProvider.of<NotesCubit>(context).fetchAllNotes();

          Navigator.pop(context);

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
                CustomSnackBar().buildSnackBar(message: 'note added'));
        }
      },
      builder: (context, state) {
        print('ui rebuild');
        return AbsorbPointer(
          absorbing: state is AddNoteLoading ? true : false,
          child: Padding(
            padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const SingleChildScrollView(child: AddNoteForm()),
          ),
        );
      },
    );
  }
}

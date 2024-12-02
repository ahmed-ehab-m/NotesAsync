import 'package:Notes/cubits/add%20note%20cubit/add_note_cubit.dart';
import 'package:Notes/cubits/add%20note%20cubit/add_note_state.dart';
import 'package:Notes/cubits/notes%20cubit/notes_cubit.dart';
import 'package:Notes/views/widgets/add_note_form.dart';
import 'package:Notes/views/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNoteBody extends StatefulWidget {
  const AddNoteBody({
    super.key,
    required this.textFieldColor,
    this.onSave,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;
  final Color textFieldColor;
  final AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final void Function({
    String? title,
    String? content,
  })? onSave;
  @override
  State<AddNoteBody> createState() => _AddNoteBodyState();
}

class _AddNoteBodyState extends State<AddNoteBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteFailure) {
          print('Failed: ${state.errorMessage}');
        }
        if (state is AddNoteSuccess) {
          BlocProvider.of<NotesCubit>(context).fetchAllNotes();

          Navigator.pop(context);

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              CustomSnackBar()
                  .buildSnackBar(message: 'Note added successfully'),
            );
        }
      },
      builder: (context, state) {
        return AddNoteForm(
          formKey: widget.formKey,
          textFieldColor: widget.textFieldColor,
          onSave: widget.onSave,
        );
      },
    );
  }
}

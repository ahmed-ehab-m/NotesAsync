import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_app/cubits/change%20font%20size%20cubit/change_font_size_cubit.dart';
import 'package:notes_app/cubits/notes%20cubit/notes_cubit.dart';
import 'package:notes_app/views/widgets/custom_snack_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

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
  String? title;
  final FocusNode focusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    delayedFocus();
  }

  void delayedFocus() async {
    await Future.delayed(const Duration(milliseconds: 800));
    if (mounted) {
      focusNode.requestFocus();
    }
  }

  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

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
        return AbsorbPointer(
          absorbing: state is AddNoteLoading ? true : false,
          child: Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SingleChildScrollView(
              child: Form(
                key: widget.formKey,
                autovalidateMode: widget.autovalidateMode,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    CustomTextField(
                      fontSize: BlocProvider.of<ChangeFontSizeCubit>(context)
                          .titleFontSize,
                      color: widget.textFieldColor,
                      onSaved: (value) {
                        title = value;
                      },
                      text: 'Title',
                      // fontSize: 24,
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Text(
                            DateFormat('MMMM dd, hh:mm a')
                                .format(DateTime.now()),
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Field is Required';
                        } else {
                          return null;
                        }
                      },
                      fontSize: BlocProvider.of<ChangeFontSizeCubit>(context)
                          .contentFontSize,
                      color: widget.textFieldColor,
                      focusNode: focusNode,
                      // autofocus: true,
                      text: 'Start typing',
                      maxLines: 20,
                      onSaved: (value) {
                        widget.onSave!(
                          content: value,
                          title: title,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

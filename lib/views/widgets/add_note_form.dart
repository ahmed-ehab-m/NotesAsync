import 'package:Notes/cubits/change%20font%20size%20cubit/change_font_size_cubit.dart';
import 'package:Notes/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm(
      {super.key,
      required this.formKey,
      required this.textFieldColor,
      this.onSave});
  final GlobalKey<FormState> formKey;
  final Color textFieldColor;
  final void Function({
    String? title,
    String? content,
  })? onSave;
  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final AutovalidateMode autovalidateMode = AutovalidateMode.always;
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
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: widget.formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 20),
              CustomTextField(
                fontSize:
                    BlocProvider.of<ChangeFontSizeCubit>(context).titleFontSize,
                color: widget.textFieldColor,
                onSaved: (value) {
                  title = value;
                },
                text: 'Title',
                // fontSize: 24,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text(
                      DateFormat('MMMM dd, hh:mm a').format(DateTime.now()),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
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
              // SizedBox(
              //   height: 16.r,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
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
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      autovalidateMode: widget.autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 20),
          CustomTextField(
            color: widget.textFieldColor,
            onSaved: (value) {
              widget.onSave?.call(
                title: value,
              );
            },
            text: 'Title',
            fontSize: 24,
          ),
          const SizedBox(height: 16),
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
          const SizedBox(height: 16),
          CustomTextField(
            color: widget.textFieldColor,
            // autofocus: true,
            text: 'Start typing',
            maxLines: 20,
            onSaved: (value) {
              widget.onSave?.call(
                content: value,
              );
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

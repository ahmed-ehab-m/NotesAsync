import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/edit_note_view_body.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  Color? backgroundColor;
  void initState() {
    super.initState();
    backgroundColor = Color(widget.noteModel.color); // تعيين اللون الحالي
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: backgroundColor,
      body: EditNoteViewBody(
        noteModel: widget.noteModel,
        // onChangeColor: (color) {
        //   setState(() {
        //     backgroundColor = color;
        //   });
        // },
      ),
    );
  }
}

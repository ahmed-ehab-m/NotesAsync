import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: EditNoteViewBody(
        noteModel: noteModel,
      ),
    );
  }

  PreferredSize appBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(70),
      child: Padding(
        padding: EdgeInsets.only(top: 30, left: 8, right: 18),
        child: customAppBar(
          title: 'Edit Note',
          icon: FontAwesomeIcons.check,
        ),
      ),
    );
  }

  AppBar customAppBar(
      {required String title, IconData? icon, void Function()? onPressed}) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 28,
            color: kSecondaryColor,
          ),
        ),
      ],
    );
  }
}

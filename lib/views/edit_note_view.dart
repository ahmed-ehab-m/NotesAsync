import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes%20cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_icon.dart';
import 'package:notes_app/views/widgets/custom_snack_bar.dart';
import 'package:notes_app/views/widgets/edit_note_colors_list_view.dart';
import 'package:notes_app/views/widgets/edit_note_view_body.dart';
import 'package:notes_app/views/widgets/test_app_bar.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({
    super.key,
    required this.noteModel,
  });
  final NoteModel noteModel;
  // final void Function(String? title, String? content) onSave;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title;
  String? content;
  Color? tfColor;
  void updateNoteData({String? title, String? content}) {
    setState(() {
      this.title = title;
      this.content = content;
      print(title);
      print(content);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTestAppBar(
        colorIcon: CustomIcon(
          icon: HugeIcons.strokeRoundedColors,
          iconColor: Colors.white,
          onPressed: () {
            showModalBottomSheet(
              barrierColor: Colors.transparent,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: EditNoteColorsListView(
                    noteModel: widget.noteModel,
                    onChangeColor: (color) {
                      setState(() {
                        tfColor = color;
                      });
                    },
                  ),
                );
              },
            );
          },
        ),
        pinIcon: CustomIcon(
          icon: HugeIcons.strokeRoundedPin,
          iconColor: widget.noteModel.pin
              ? kPrimaryColor
              : Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
          onPressed: () async {
            widget.noteModel.pin = !widget.noteModel.pin;
            await widget.noteModel.save();
            setState(() {
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            });
          },
        ),
        deleteIcon: CustomIcon(
          icon: HugeIcons.strokeRoundedDelete02,
          iconColor: Colors.white,
          onPressed: () {
            widget.noteModel.delete();
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                CustomSnackBar().buildSnackBar(message: 'Note deleted'),
              );
          },
        ),
        checkIcon: CustomIcon(
          icon: HugeIcons.strokeRoundedCheckmarkSquare04,
          iconColor: Colors.white,
          onPressed: () async {
            widget.noteModel.title = title ?? widget.noteModel.title;
            widget.noteModel.subtitle = content ?? widget.noteModel.subtitle;
            widget.noteModel.color = tfColor?.value ?? widget.noteModel.color;
            await widget.noteModel.save();
            // ignore: use_build_context_synchronously
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            // ignore: use_build_context_synchronously
            Navigator.pop(context);
            // widget.onSave(widget.noteModel.title, widget.noteModel.subtitle);
          },
        ),
      ),
      body: EditNoteViewBody(
        initialTitle: widget.noteModel.title,
        initialContent: widget.noteModel.subtitle,
        noteModel: widget.noteModel,
        onSave: updateNoteData,
        textFieldColor: tfColor ?? Color(widget.noteModel.color),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/notes%20cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/add_note_body.dart';
import 'package:notes_app/views/widgets/colors_list_view.dart';
import 'package:notes_app/views/widgets/custom_icon.dart';
import 'package:notes_app/views/widgets/test_app_bar.dart';

class AddNoteView extends StatefulWidget {
  const AddNoteView({super.key});

  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
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
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ColorsListView(
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
        checkIcon: CustomIcon(
          icon: HugeIcons.strokeRoundedCheckmarkSquare04,
          iconColor: Colors.white,
          onPressed: () {
            validation(context);
          },
        ),
      ),
      body: AddNoteBody(
        formKey: formKey,
        textFieldColor: tfColor ?? kColors[0],
        onSave: updateNoteData,
      ),
    );
  }

  void validation(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      print('Title: $title, Content: $content'); // التحقق من القيم

      if (title == null || content == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill out all fields')),
        );
        return;
      }

      var currnetDate = DateTime.now();
      var formattedCurrntDate =
          DateFormat('MMM dd hh:mm a').format(currnetDate);
      var noteModel = NoteModel(
        title: title!,
        subtitle: content!,
        date: formattedCurrntDate,
        color: tfColor?.value ?? kColors[0].value,
        pin: false,
      );

      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}

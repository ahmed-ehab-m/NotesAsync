import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/change%20font%20size%20cubit/change_font_size_cubit.dart';
import 'package:notes_app/cubits/change%20font%20size%20cubit/change_font_size_state.dart';
import 'package:notes_app/cubits/notes%20cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_edit_texr_field.dart';
import 'package:notes_app/views/widgets/edit_note_colors_list_view.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title;
  String? content;
  Color? textFieldColor;
  void initState() {
    super.initState();
    textFieldColor = Color(widget.noteModel.color); // تعيين اللون الحالي
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeFontSizeCubit, ChangeFontSizeState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 55,
                ),
                CustomAppBar(
                  showPrefixIcon: true,
                  title: '',
                  pinIcon: widget.noteModel.pin
                      ? Icons.push_pin
                      : Icons.push_pin_outlined,
                  iconColor:
                      widget.noteModel.pin ? kPrimaryColor : kSecondaryColor,
                  onPinPressed: () async {
                    widget.noteModel.pin = !widget.noteModel.pin;
                    await widget.noteModel.save();
                    setState(() {
                      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    });
                  },
                  deleteIcon: FontAwesomeIcons.trashCan,
                  onDeletePressed: () {
                    widget.noteModel.delete();
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    Navigator.pop(context);
                  },
                  icon: FontAwesomeIcons.check,
                  onPressed: () async {
                    widget.noteModel.title = title ?? widget.noteModel.title;
                    widget.noteModel.subtitle =
                        content ?? widget.noteModel.subtitle;
                    await widget.noteModel.save();
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomEditTextField(
                  fontSize:
                      BlocProvider.of<ChangeFontSizeCubit>(context).fontSize,
                  text: widget.noteModel.title,
                  color: textFieldColor!,
                  onChanged: (value) {
                    print(
                        BlocProvider.of<ChangeFontSizeCubit>(context).fontSize);
                    title = value;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomEditTextField(
                  fontSize:
                      BlocProvider.of<ChangeFontSizeCubit>(context).fontSize,
                  text: widget.noteModel.subtitle,
                  color: Color(widget.noteModel.color),
                  onChanged: (value) {
                    content = value;
                  },
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 16,
                ),
                EditNoteColorsListView(
                  noteModel: widget.noteModel,
                  onChangeColor: (color) {
                    setState(() {
                      textFieldColor = color;
                    });
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

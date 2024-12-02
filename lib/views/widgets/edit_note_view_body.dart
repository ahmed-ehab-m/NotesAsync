import 'package:Notes/cubits/change%20font%20size%20cubit/change_font_size_cubit.dart';
import 'package:Notes/cubits/change%20font%20size%20cubit/change_font_size_state.dart';
import 'package:Notes/models/note_model.dart';
import 'package:Notes/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({
    super.key,
    required this.noteModel,
    required this.onSave,
    required this.initialTitle,
    required this.initialContent,
    required this.textFieldColor,
  });
  final NoteModel noteModel;
  final String initialTitle;
  final String initialContent;
  final Color textFieldColor;
  final void Function({
    String? title,
    String? content,
  })? onSave;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  late TextEditingController titleController;
  late TextEditingController contentController;

  String? title;
  String? content;

  void initState() {
    super.initState();

    titleController = TextEditingController(text: widget.initialTitle);
    contentController = TextEditingController(text: widget.initialContent);
  }

  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeFontSizeCubit, ChangeFontSizeState>(
      builder: (context, state) {
        final double screenHeight = MediaQuery.of(context).size.height;
        final double screenWidth = MediaQuery.of(context).size.width;

        final double contentFontSize =
            BlocProvider.of<ChangeFontSizeCubit>(context).contentFontSize;
        final double titleFontSize =
            BlocProvider.of<ChangeFontSizeCubit>(context).titleFontSize;
        final double lineHeight = contentFontSize * 2.1;
        final int maxLines = (screenHeight / lineHeight).floor();

        final double padding = screenWidth * 0.04;
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: Column(
              children: [
                SizedBox(
                  height: 20.r,
                ),
                CustomTextField(
                  fontSize: titleFontSize,
                  text: widget.noteModel.title,
                  controller: titleController,
                  color: widget.textFieldColor,
                  onChanged: (value) {
                    // title = value;
                    widget.onSave!(
                      title: value,
                    );
                  },
                ),
                SizedBox(
                  height: 10.r,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.r),
                  child: Row(children: [
                    Text(
                      widget.noteModel.date,
                      style: TextStyle(fontSize: 12.sp),
                    )
                  ]),
                ),
                SizedBox(
                  height: 10.r,
                ),
                CustomTextField(
                  fontSize: contentFontSize,
                  text: widget.noteModel.subtitle,
                  color: widget.textFieldColor,
                  controller: contentController,
                  onChanged: (value) {
                    widget.onSave!(
                      content: value,
                    );
                  },
                  maxLines: maxLines,
                ),
                SizedBox(
                  height: 16.r,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/color_item.dart';

class EditNoteColorsListView extends StatefulWidget {
  const EditNoteColorsListView(
      {super.key, required this.noteModel, required this.onChangeColor});
  final NoteModel noteModel;
  final void Function(Color) onChangeColor;
  @override
  State<EditNoteColorsListView> createState() => _EditNoteColorsListViewState();
}

class _EditNoteColorsListViewState extends State<EditNoteColorsListView> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.noteModel.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                // widget.noteModel.color = kColors[index].value;
                setState(() {});
                widget.onChangeColor(kColors[index]); //
              },
              child: ColorItem(
                // backgroundColor: BlocProvider.of<ChangeThemeCubit>(context) ,
                isActive: currentIndex == index,
                color: kColors[index],
              ),
            ),
          );
        },
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

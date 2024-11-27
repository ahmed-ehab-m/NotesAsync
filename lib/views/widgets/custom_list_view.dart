import 'package:Notes/models/note_model.dart';
import 'package:Notes/views/widgets/custom_note_item.dart';
import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  const CustomListView(
      {super.key,
      required this.notes,
      this.pattern,
      required this.togglePin,
      required this.buildHighlightedTextTitle,
      required this.buildHighlightedTextSubTitle});
  final List<NoteModel> notes;
  final String? pattern;
  final void Function(int) togglePin;
  final Widget Function(String text, String pattern) buildHighlightedTextTitle;
  final Widget Function(String text, String pattern)
      buildHighlightedTextSubTitle;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: notes.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: NoteItem(
            noteModel: notes[index],
            onPressed: () => togglePin(index),
            onSelectPin: () {
              togglePin(index);
            },
            status: notes[index].pin ? 'Unpin' : 'Pin',
            showPin: notes[index].pin ? true : false,
            pattern: pattern,
            textTitle:
                buildHighlightedTextTitle(notes[index].title, pattern ?? ''),
            textSubTitle: buildHighlightedTextSubTitle(
                notes[index].subtitle, pattern ?? ''),
          ),
        );
      },
    );
  }
}

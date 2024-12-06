import 'package:Notes/helper/responsive.dart';
import 'package:Notes/models/note_model.dart';
import 'package:Notes/views/widgets/custom_note_item.dart';
import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
    required this.notes,
    required this.togglePin,
    required this.buildHighlightedText,
  });
  final List<NoteModel> notes;

  final void Function(int) togglePin;
  final Widget Function(String text, String type) buildHighlightedText;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: notes.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Padding(
          padding: ResponsiveSpacing.symmetricPadding(vertical: 4),
          child: CustomNoteItem(
            noteModel: notes[index],
            onPressed: () => togglePin(index),
            onSelectPin: () {
              togglePin(index);
            },
            status: notes[index].pin ? 'Unpin' : 'Pin',
            showPin: notes[index].pin ? true : false,
            textTitle: buildHighlightedText(notes[index].title, 'title'),
            textSubTitle:
                buildHighlightedText(notes[index].subtitle, 'subTitle'),
          ),
        );
      },
    );
  }
}

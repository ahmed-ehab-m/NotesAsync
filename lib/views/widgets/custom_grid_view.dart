import 'package:Notes/helper/responsive.dart';
import 'package:Notes/models/note_model.dart';
import 'package:Notes/views/widgets/custom_note_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
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
    return Padding(
      padding: ResponsiveSpacing.symmetricPadding(vertical: 4),
      child: MasonryGridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: ResponsiveSpacing.value(8),
        crossAxisSpacing: ResponsiveSpacing.value(8),
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return CustomNoteItem(
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
          );
        },
      ),
    );
  }
}

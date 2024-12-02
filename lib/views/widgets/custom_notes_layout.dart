import 'package:Notes/constants.dart';
import 'package:Notes/cubits/notes%20cubit/notes_state.dart';
import 'package:Notes/models/note_model.dart';
import 'package:Notes/views/widgets/custom_grid_view.dart';
import 'package:Notes/views/widgets/custom_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/notes cubit/notes_cubit.dart';

class CustomNotesLayout extends StatefulWidget {
  const CustomNotesLayout({
    super.key,
    this.pattern,
  });
  final String? pattern;
  @override
  State<CustomNotesLayout> createState() => _CustomNotesLayoutState();
}

class _CustomNotesLayoutState extends State<CustomNotesLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).filteredNotes ?? [];
        void togglePin(int index) async {
          NoteModel note = notes[index];
          note.pin = !note.pin;
          await note.save();
          setState(() {
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
          });
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: BlocProvider.of<NotesCubit>(context).layout == 'GridView'
              ? CustomGridView(
                  notes: notes,
                  togglePin: togglePin,
                  buildHighlightedText: buildHighlightedText,
                )
              : CustomListView(
                  notes: notes,
                  togglePin: togglePin,
                  buildHighlightedText: buildHighlightedText,
                ),
        );
      },
    );
  }

  Widget buildHighlightedText(String text, String type) {
    TextStyle buildTextStyle({Color? color}) {
      return TextStyle(
          fontSize: type == 'title' ? 26 : 14,
          fontWeight: FontWeight.w600,
          color: color);
    }

    Text buildTextWidget() {
      return Text(
        text,
        maxLines: type == 'title' ? 1 : 9,
        overflow: TextOverflow.ellipsis,
        style: buildTextStyle(),
      );
    }

    if (widget.pattern!.isEmpty) {
      return buildTextWidget();
    }
    final regExp = RegExp(RegExp.escape(widget.pattern!), caseSensitive: false);
    final matches = regExp.allMatches(text);
    if (matches.isEmpty) {
      return buildTextWidget();
    }

    List<TextSpan> spans = [];
    int lastMatchEnd = 0;

    for (final match in matches) {
      if (match.start != lastMatchEnd) {
        spans.add(TextSpan(
          text: text.substring(lastMatchEnd, match.start),
          style: buildTextStyle(),
        ));
      }
      spans.add(
        TextSpan(
          text: text.substring(match.start, match.end),
          style: buildTextStyle(color: kPrimaryColor),
        ),
      );
      lastMatchEnd = match.end;
    }

    if (lastMatchEnd != text.length) {
      spans.add(
        TextSpan(
          text: text.substring(lastMatchEnd),
          style: buildTextStyle(),
        ),
      );
    }

    return RichText(
      text: TextSpan(children: spans),
    );
  }
}

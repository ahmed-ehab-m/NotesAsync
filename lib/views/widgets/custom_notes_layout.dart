import 'package:Notes/constants.dart';
import 'package:Notes/cubits/notes%20cubit/notes_state.dart';
import 'package:Notes/models/note_model.dart';
import 'package:Notes/views/widgets/custom_grid_view.dart';
import 'package:Notes/views/widgets/custom_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/notes cubit/notes_cubit.dart';

class CustomNotesGridView extends StatefulWidget {
  const CustomNotesGridView({
    super.key,
    this.pattern,
  });
  final String? pattern;
  @override
  State<CustomNotesGridView> createState() => _CustomNotesGridViewState();
}

class _CustomNotesGridViewState extends State<CustomNotesGridView> {
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
            child: BlocProvider.of<NotesCubit>(context).layout
                ? CustomGridView(
                    notes: notes,
                    togglePin: togglePin,
                    buildHighlightedTextTitle: _buildHighlightedTextTitle,
                    buildHighlightedTextSubTitle: _buildHighlightedTextSubTitle,
                  )
                : CustomListView(
                    notes: notes,
                    togglePin: togglePin,
                    buildHighlightedTextTitle: _buildHighlightedTextTitle,
                    buildHighlightedTextSubTitle: _buildHighlightedTextSubTitle,
                  ));
      },
    );
  }

  Widget _buildHighlightedTextTitle(String text, String pattern) {
    if (pattern.isEmpty) {
      return Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          // color: Colors.black,
          fontSize: 26,
          fontWeight: FontWeight.w600,
        ),
      );
    }

    final regExp = RegExp(RegExp.escape(pattern), caseSensitive: false);
    final matches = regExp.allMatches(text);
    if (matches.isEmpty) {
      return Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          // color: Colors.black,
          fontSize: 26,
          fontWeight: FontWeight.w600,
        ),
      ); // إرجاع النص كما هو إذا لم يكن هناك تطابق
    }

    List<TextSpan> spans = [];
    int lastMatchEnd = 0;

    for (final match in matches) {
      if (match.start != lastMatchEnd) {
        spans.add(TextSpan(
          text: text.substring(lastMatchEnd, match.start),
          style: const TextStyle(
            // color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ));
      }
      spans.add(TextSpan(
        text: text.substring(match.start, match.end),
        style: TextStyle(
            color: kPrimaryColor, fontWeight: FontWeight.w600, fontSize: 26),
      ));
      lastMatchEnd = match.end;
    }

    if (lastMatchEnd != text.length) {
      spans.add(TextSpan(
        text: text.substring(lastMatchEnd),
        style: const TextStyle(
          // color: Colors.black,
          fontSize: 26,
          fontWeight: FontWeight.w600,
        ),
      ));
    }

    return RichText(
      text: TextSpan(children: spans),
    );
  }

  Widget _buildHighlightedTextSubTitle(String text, String pattern) {
    if (pattern.isEmpty) {
      return Text(
        text,
        maxLines: 9,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 14,
        ),
      ); // إرجاع النص كما هو إذا لم يكن هناك نمط بحث
    }

    final regExp = RegExp(RegExp.escape(pattern), caseSensitive: false);
    final matches = regExp.allMatches(text);
    if (matches.isEmpty) {
      return Text(
        text,
        maxLines: 9,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 14,
        ),
      );
    }

    List<TextSpan> spans = [];
    int lastMatchEnd = 0;

    for (final match in matches) {
      if (match.start != lastMatchEnd) {
        spans.add(TextSpan(
          text: text.substring(lastMatchEnd, match.start),
          style: const TextStyle(
            fontSize: 14,
          ),
        ));
      }
      spans.add(TextSpan(
        text: text.substring(match.start, match.end),
        style: TextStyle(color: kPrimaryColor, fontSize: 14),
      ));
      lastMatchEnd = match.end;
    }

    if (lastMatchEnd != text.length) {
      spans.add(TextSpan(
        text: text.substring(lastMatchEnd),
        style: const TextStyle(
          fontSize: 14,
        ),
      ));
    }

    return RichText(
      text: TextSpan(children: spans),
    );
  }
}

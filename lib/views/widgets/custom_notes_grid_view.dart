import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes%20cubit/notes_state.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_note_item.dart';

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
  // bool showOptions = false;
  // PersistentBottomSheetController? bottomSheetController;
  // bool isBottomSheetVisible = true;
  // void _toggleOptions() {
  //   setState(() {
  //     showOptions = !showOptions;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).filteredNotes ?? [];
        // void searchNote() {
        //   setState(() {
        //     BlocProvider.of<NotesCubit>(context)
        //         .fetchAllNotes(pattern: widget.pattern);
        //   });
        // }

        void togglePin(int index) async {
          NoteModel note = notes[index];
          note.pin = !note.pin;
          await note.save();
          setState(() {
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
          }); // إعادة تحميل وفرز العناصر بعد التحديث
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // عدد الأعمدة في الشبكة
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.6,
            ),
            itemCount: notes.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: GestureDetector(
                  child: NoteItem(
                    // showOptions: showOptions,
                    noteModel: notes[index],
                    icon: notes[index].pin
                        ? HugeIcons.strokeRoundedPin
                        : HugeIcons.strokeRoundedPin,
                    color: notes[index].pin ? kPrimaryColor : kSecondaryColor,
                    onPressed: () => togglePin(index),
                    onSelectPin: () {
                      togglePin(index);
                    },
                    status: notes[index].pin ? 'Unpin' : 'Pin',
                    showPin: notes[index].pin ? true : false,
                    pattern: widget.pattern,
                    textTitle: _buildHighlightedTextTitle(
                        notes[index].title, widget.pattern ?? ''),
                    textSubTitle: _buildHighlightedTextSubTitle(
                        notes[index].subtitle, widget.pattern ?? ''),
                    // textStyleTitle: highlightedText(
                    //     notes[index].title, widget.pattern ?? ''),
                    // textStyleSubTitle: highlightedText(
                    //     notes[index].subtitle, widget.pattern ?? ''),
                  ),
                ),
              );
            },
          ),
        );
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
      ); // إرجاع النص كما هو إذا لم يكن هناك نمط بحث
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
        style: TextStyle(fontSize: 14, color: Colors.grey[300]),
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

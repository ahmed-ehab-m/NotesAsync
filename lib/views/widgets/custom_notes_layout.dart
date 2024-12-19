import 'package:Notes/constants.dart';
import 'package:Notes/cubits/notes%20cubit/notes_state.dart';
import 'package:Notes/helper/build_highlighted_text.dart';
import 'package:Notes/helper/responsive.dart';
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
          padding: ResponsiveSpacing.symmetricPadding(vertical: 16),
          child: BlocProvider.of<NotesCubit>(context).layout == KGridView
              ? CustomGridView(
                  notes: notes,
                  togglePin: togglePin,
                  buildHighlightedText:
                      BuildHighlightedText(widget.pattern, context)
                          .highlightedText,
                )
              : CustomListView(
                  notes: notes,
                  togglePin: togglePin,
                  buildHighlightedText:
                      BuildHighlightedText(widget.pattern, context)
                          .highlightedText,
                ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes%20cubit/notes_cubit.dart';
import 'package:notes_app/views/widgets/custom_notes_grid_view.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({
    super.key,
  });

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  String? searchPattern = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            showIcon: true,
            onChanged: (value) {
              setState(() {
                searchPattern = value;
              });
              BlocProvider.of<NotesCubit>(context)
                  .fetchAllNotes(pattern: value);
            },

            // widget.onPressedSearch;

            text: 'Search',
          ),
          const SizedBox(
            height: 10,
          ),
          // SizedBox(height: 350, child: CustomPinNotesView()),
          Expanded(
              child: CustomNotesGridView(
            pattern: searchPattern,
          )),
        ],
      ),
    );
  }
}

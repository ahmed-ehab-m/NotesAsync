import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/change%20theme%20cubit/change_theme_cubit.dart';
import 'package:notes_app/cubits/change%20theme%20cubit/change_theme_state.dart';
import 'package:notes_app/cubits/notes%20cubit/notes_cubit.dart';
import 'package:notes_app/views/widgets/custom_notes_grid_view.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({
    super.key,
    required this.searchFocusNode,
  });
  final FocusNode searchFocusNode;
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
    return BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                focusNode: widget.searchFocusNode,
                color: Color(0x1A9E9E9E),
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
              CustomNotesGridView(
                pattern: searchPattern,
              ),
            ],
          ),
        );
      },
    );
  }
}

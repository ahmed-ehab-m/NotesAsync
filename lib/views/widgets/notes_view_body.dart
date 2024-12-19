import 'package:Notes/cubits/change%20theme%20cubit/change_theme_cubit.dart';
import 'package:Notes/cubits/change%20theme%20cubit/change_theme_state.dart';
import 'package:Notes/cubits/notes%20cubit/notes_cubit.dart';
import 'package:Notes/cubits/notes%20cubit/notes_state.dart';
import 'package:Notes/helper/responsive.dart';
import 'package:Notes/views/widgets/custom_notes_layout.dart';
import 'package:Notes/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  String? searchPattern = '';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
      builder: (context, state) {
        return Padding(
          padding: ResponsiveSpacing.symmetricPadding(horizontal: 16),
          child: ListView(
            children: [
              SizedBox(height: ResponsiveSpacing.horizontal(20)),
              CustomTextField(
                focusNode: widget.searchFocusNode,
                color: Color(0x269E9E9E),
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
              SizedBox(
                height: ResponsiveSpacing.horizontal(10),
              ),
              BlocBuilder<NotesCubit, NotesState>(builder: (context, state) {
                return BlocProvider.of<NotesCubit>(context).notes!.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            'assets/images/Add notes-bro (1).png',
                            height: ResponsiveSpacing.horizontal(500),
                            width: ResponsiveSpacing.vertical(500),
                          ),
                          Text(
                            'Write your thoughts here…',
                            style: TextStyle(
                                fontFamily: 'Making Cookies',
                                fontSize: 30,
                                color: Colors.grey),
                          ),
                        ],
                      )
                    : CustomNotesLayout(
                        pattern: searchPattern,
                      );
              }),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes%20cubit/notes_cubit.dart';
import 'package:notes_app/cubits/pin%20_notes_cubit/pin_notes_cubit.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_notes_list_view.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PinNotesCubit(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            CustomAppBar(title: 'My Notes', icon: Icons.settings),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
              text: 'Search',
            ),
            SizedBox(
              height: 10,
            ),
            // SizedBox(height: 350, child: CustomPinNotesView()),
            Expanded(child: CustomNotesListView()),
          ],
        ),
      ),
    );
  }
}

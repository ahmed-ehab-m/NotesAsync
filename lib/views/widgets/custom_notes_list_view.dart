import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes%20cubit/notes_state.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_note_item.dart';

import '../../cubits/notes cubit/notes_cubit.dart';

class CustomNotesListView extends StatefulWidget {
  const CustomNotesListView({super.key});

  @override
  State<CustomNotesListView> createState() => _CustomNotesListViewState();
}

class _CustomNotesListViewState extends State<CustomNotesListView> {
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
            BlocProvider.of<NotesCubit>(context).notes ?? [];
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
                        ? Icons.push_pin
                        : Icons.push_pin_outlined,
                    color: notes[index].pin ? kPrimaryColor : kSecondaryColor,
                    onPressed: () => togglePin(index),
                    onSelectPin: () {
                      togglePin(index);
                    },
                    status: notes[index].pin ? 'Pinned' : 'Pin',
                    showPin: notes[index].pin ? true : false,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

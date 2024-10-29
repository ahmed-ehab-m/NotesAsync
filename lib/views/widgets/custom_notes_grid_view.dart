import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes%20cubit/notes_state.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_note_item.dart';

import '../../cubits/notes cubit/notes_cubit.dart';

class CustomNotesGridView extends StatefulWidget {
  const CustomNotesGridView({
    super.key,
  });

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

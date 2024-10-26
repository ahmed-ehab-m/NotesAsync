import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  @override
  OverlayEntry? _overlayEntry;
  bool _showOptions = false;
  void _toggleOptions() {
    setState(() {
      _showOptions = !_showOptions;
    });
  }

  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).notes ?? [];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // عدد الأعمدة في الشبكة
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.7,
            ),
            itemCount: notes.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: GestureDetector(
                    onLongPress: () {
                      _toggleOptions();
                      showBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              padding: const EdgeInsets.only(
                                  left: 24, top: 10, right: 24),
                              height: 55,
                              color: Colors.black,
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Icon(
                                        CupertinoIcons.pin,
                                      ),
                                      Text('Pin'),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 24,
                                  ),
                                  Column(
                                    children: [
                                      Icon(
                                        CupertinoIcons.folder,
                                      ),
                                      Text('add to folder'),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 24,
                                  ),
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.delete_outline,
                                      ),
                                      Text('Delete'),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    child: NoteItem(
                      noteModel: notes[index],
                      showOptions: _showOptions,
                    )),
              );
            },
          ),
        );
      },
    );
  }
}

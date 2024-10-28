import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes%20cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:pie_menu/pie_menu.dart';

class NoteItem extends StatefulWidget {
  const NoteItem({
    super.key,
    required this.noteModel,
    required this.onPressed,
    required this.icon,
    required this.color,
    // required this.showOptions,
    // this.currentIndex = 0,
  });
  final NoteModel noteModel;
  final void Function()? onPressed;
  final IconData icon;
  final Color color;
  // final bool showOptions;
  // final int currentIndex;

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  @override
  bool iconSelected = false;
  Color color = kSecondaryColor;
  // int noteIndex = 0;
  // void noteSelected() {
  //   if (noteIndex == widget.currentIndex) {
  //     _toggleIcon();
  //   }
  // }

  @override
  void _toggleIcon() {
    setState(() {
      iconSelected = !iconSelected;
    });
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNoteView(
                noteModel: widget.noteModel,
              );
            },
          ),
        );
      },
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) {
      //       return EditNoteView(
      //         noteModel: noteModel,
      //       );
      //     },
      //   ),
      // );
      child: PieMenu(
        theme: PieTheme(
            buttonThemeHovered: PieButtonTheme(
                backgroundColor: kPrimaryColor, iconColor: Colors.white),
            buttonTheme: PieButtonTheme(
                backgroundColor: Colors.white, iconColor: kPrimaryColor)),
        // onPressed: () => print('pressed'),
        actions: [
          PieAction(
            tooltip: const Text('Pin'),
            onSelect: () => print('Pinned'),
            child: const Icon(
              Icons.push_pin,
            ), // Can be any widget
          ),
          PieAction(
            tooltip: const Text('Delete'),
            onSelect: () => print('Deleted'),
            child: const Icon(
              FontAwesomeIcons.trash,
              color: Colors.red,
            ), // Can be any widget
          ),
        ],
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              decoration: BoxDecoration(
                  color: Color(widget.noteModel.color),
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.noteModel.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      // color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      widget.noteModel.subtitle,
                      maxLines: 9,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.noteModel.date,
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.5),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (false)
              Positioned(
                top: 8,
                right: 8,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          widget.noteModel.delete();
                          BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                        },
                        icon: Icon(
                          FontAwesomeIcons.trash,
                          color: kSecondaryColor,
                          size: 24,
                        )),
                    CircleAvatar(
                      backgroundColor: Color(widget.noteModel.color),
                      child: IconButton(
                        icon: Icon(
                          widget.icon,
                          color: widget.color,
                        ),
                        onPressed: widget.onPressed,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}



// ListTile(
//               title: Text(
//                 noteModel.title,
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 26,
//                 ),
//               ),
//               subtitle: Padding(
//                 padding: const EdgeInsets.only(top: 16, bottom: 16),
//                 child: Text(
//                   noteModel.subtitle,
//                   style: TextStyle(
//                     color:
//                         const Color.fromARGB(255, 100, 32, 32).withOpacity(0.5),
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//               trailing: IconButton(
//                   onPressed: () {
//                     noteModel.delete();
//                     BlocProvider.of<NotesCubit>(context).fetchAllNotes();
//                   },
//                   icon: const Icon(
//                     FontAwesomeIcons.trash,
//                     color: Colors.black,
//                     size: 24,
//                   )),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(right: 24),
//               child: Text(
//                 noteModel.date,
//                 style: TextStyle(
//                   color: Colors.black.withOpacity(0.5),
//                   fontSize: 16,
//                 ),
//               ),
//             ),
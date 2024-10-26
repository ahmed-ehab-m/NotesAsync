import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteItem extends StatefulWidget {
  const NoteItem({super.key, required this.noteModel, this.showOptions});
  final NoteModel noteModel;
  final showOptions;
  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  @override
  bool iconSelected = false;
  void _toggleIcon() {
    setState(() {
      iconSelected = !iconSelected;
    });
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
                // IconButton(
                //     onPressed: () {
                //       noteModel.delete();
                //       BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                //     },
                //     icon: const Icon(
                //       FontAwesomeIcons.trash,
                //       color: Colors.black,
                //       size: 24,
                //     )),
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
          if (widget.showOptions)
            Positioned(
              top: 8,
              right: 8,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(widget.noteModel.color),
                    child: iconSelected
                        ? IconButton(
                            icon: const Icon(CupertinoIcons.check_mark_circled,
                                color: Colors.amber),
                            onPressed: _toggleIcon)
                        : IconButton(
                            icon: const Icon(CupertinoIcons.circle_fill,
                                color: Colors.grey),
                            onPressed: _toggleIcon),
                  ),
                ],
              ),
            ),
        ],
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
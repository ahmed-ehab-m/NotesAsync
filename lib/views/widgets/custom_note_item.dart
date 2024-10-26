import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteItem extends StatefulWidget {
  const NoteItem({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  bool _showOptions = false; // للتحكم في إظهار الأيقونات

  void _toggleOptions() {
    setState(() {
      _showOptions = !_showOptions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleOptions,
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
                Spacer(),
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
          if (_showOptions)
            Positioned(
              top: 8,
              right: 8,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: IconButton(
                      icon: Icon(Icons.check_circle, color: Colors.white),
                      onPressed: () {
                        // فعل التثبيت
                      },
                    ),
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
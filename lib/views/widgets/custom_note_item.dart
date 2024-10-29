import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes%20cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/views/widgets/pin_icon.dart';
import 'package:pie_menu/pie_menu.dart';

class NoteItem extends StatefulWidget {
  const NoteItem(
      {super.key,
      required this.noteModel,
      required this.onPressed,
      required this.icon,
      required this.color,
      required this.onSelectPin,
      required this.status,
      required this.showPin});
  final NoteModel noteModel;
  final void Function()? onPressed;
  final dynamic Function() onSelectPin;
  final IconData icon;
  final Color color;
  final String status;
  final bool showPin;
  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  @override
  @override
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
      child: PieMenu(
        theme: pieTheme(),
        // onPressed: () => print('pressed'),
        actions: [
          PieAction(
            tooltip: Text(widget.status),
            onSelect: widget.onSelectPin,
            child: Icon(
              widget.icon,
            ), // Can be any widget
          ),
          PieAction(
            tooltip: const Text('Delete'),
            onSelect: () {
              widget.noteModel.delete();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            },
            child: const Icon(FontAwesomeIcons.trashCan), // Can be any widget
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
            if (widget.showPin) pinIcon(widget: widget),
          ],
        ),
      ),
    );
  }

  PieTheme pieTheme() {
    return const PieTheme(
        buttonThemeHovered: PieButtonTheme(
            backgroundColor: kPrimaryColor, iconColor: Colors.white),
        buttonTheme: PieButtonTheme(
            backgroundColor: Colors.white, iconColor: kPrimaryColor));
  }
}

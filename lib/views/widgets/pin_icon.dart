import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/views/widgets/custom_note_item.dart';

class pinIcon extends StatelessWidget {
  const pinIcon({
    super.key,
    required this.widget,
  });

  final NoteItem widget;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      right: 8,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Color(widget.noteModel.color),
            child: IconButton(
                icon: const Icon(Icons.push_pin, color: kPrimaryColor),
                onPressed: widget.onPressed),
          ),
        ],
      ),
    );
  }
}

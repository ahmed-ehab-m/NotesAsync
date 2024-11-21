import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:notes_app/views/widgets/add_note_body.dart';
import 'package:notes_app/views/widgets/custom_icon.dart';
import 'package:notes_app/views/widgets/test_app_bar.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTestAppBar(
        colorIcon: CustomIcon(
            icon: HugeIcons.strokeRoundedColors,
            iconColor: Colors.white,
            onPressed: () {}),
        checkIcon: CustomIcon(
            icon: HugeIcons.strokeRoundedCheckmarkSquare04,
            iconColor: Colors.white,
            onPressed: () {}),
      ),
      body: AddNoteBody(),
    );
  }
}

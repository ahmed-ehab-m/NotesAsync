import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/views/add_note_view.dart';
import 'package:notes_app/views/settings_view.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_icon.dart';
import 'package:notes_app/views/widgets/notes_view_body.dart';
import 'package:pie_menu/pie_menu.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return PieCanvas(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'My Notes',
          checkIcon: CustomIcon(
            icon: HugeIcons.strokeRoundedSlidersHorizontal,
            // iconColor: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SettingsView();
                  },
                ),
              );
            },
          ),
        ),
        body: const NotesViewBody(),
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: kPrimaryColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return AddNoteView();
                },
              ),
            );

            // showModalBottomSheet(
            //     isScrollControlled: true,
            //     context: context,
            //     builder: (context) {
            //       return const AddNoteBottomSheet();
            //     });
          },
          child: const Icon(
            FontAwesomeIcons.plus,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

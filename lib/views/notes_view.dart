import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/views/settings_view.dart';
import 'package:notes_app/views/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/views/widgets/notes_view_body.dart';
import 'package:pie_menu/pie_menu.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return PieCanvas(
      child: Scaffold(
        appBar: appBar(context),
        body: const NotesViewBody(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return const AddNoteBottomSheet();
                });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  PreferredSize appBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(40),
      child: Padding(
        padding: EdgeInsets.only(left: 8, right: 18),
        child: customAppBar(
          title: 'My Notes',
          icon: FontAwesomeIcons.sliders,
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
    );
  }

  AppBar customAppBar(
      {required String title, IconData? icon, void Function()? onPressed}) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 28,
            color: kSecondaryColor,
          ),
        ),
      ],
    );
  }
}

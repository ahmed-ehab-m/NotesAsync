import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/views/widgets/settings_view_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SettingsViewBody(),
    );
  }

  PreferredSize appBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(40),
      child: Padding(
        padding: EdgeInsets.only(left: 8),
        child: customAppBar(
          title: 'My Notes',
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

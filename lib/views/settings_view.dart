import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/settings_view_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingsViewBody(),
    );
  }
}

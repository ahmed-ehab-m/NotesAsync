import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/settings_view_body.dart';
import 'package:notes_app/views/widgets/test_app_bar.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomTestAppBar(
        title: 'Settings ',
      ),
      body: SettingsViewBody(),
    );
  }
}

import 'package:Notes/views/widgets/custom_app_bar.dart';
import 'package:Notes/views/widgets/settings_view_body.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
          // title: 'Settings ',
          ),
      body: SettingsViewBody(),
    );
  }
}

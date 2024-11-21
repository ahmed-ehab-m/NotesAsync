import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:notes_app/views/widgets/custom_icon.dart';
import 'package:notes_app/views/widgets/test_app_bar.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTestAppBar(
        title: 'My Notes',
        checkIcon: CustomIcon(
          icon: FontAwesomeIcons.check,
          onPressed: () {},
        ),
        colorIcon: CustomIcon(
          icon: HugeIcons.strokeRoundedColors,
          onPressed: () {},
        ),
        deleteIcon: CustomIcon(
          icon: HugeIcons.strokeRoundedDelete02,
          onPressed: () {},
        ),
        pinIcon: CustomIcon(
          icon: HugeIcons.strokeRoundedPin,
          onPressed: () {},
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/views/widgets/custom_drop_down_menu.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Style',
            style: TextStyle(fontSize: 16, color: kSecondaryColor),
          ),
          Divider(),
          SizedBox(
            height: 15,
          ),
          Row(children: [
            Text(
              'Font Size',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            CustomDropdownMenu(
              initialSelection: 1,
              firstOption: 'Small',
              secondOption: 'Medium',
              thridption: 'Large',
              fourthOption: 'Huge',
            ),
          ]),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Text(
                'Theme',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              CustomDropdownMenu(
                  initialSelection: 2,
                  firstOption: 'Light',
                  secondOption: 'Dark',
                  thridption: 'Default'),
            ],
          )
        ],
      ),
    );
  }
}

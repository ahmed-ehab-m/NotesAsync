import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/change%20theme%20cubit/change_theme_cubit.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_drop_down_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsViewBody extends StatefulWidget {
  const SettingsViewBody({super.key});

  @override
  State<SettingsViewBody> createState() => _SettingsViewBodyState();
}

class _SettingsViewBodyState extends State<SettingsViewBody> {
  @override
  int? index;
  void initState() {
    super.initState();
    loadInitialIndex();
  }

  Future<void> loadInitialIndex() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      index = prefs.getInt('themeIndex') ?? 3;
    });
  }

  Future<void> saveIndex(int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('themeIndex', value);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 55,
          ),
          const CustomAppBar(
            title: 'My Notes',
            showPrefixIcon: true,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Style',
            style: TextStyle(fontSize: 16, color: kSecondaryColor),
          ),
          const Divider(),
          const SizedBox(
            height: 15,
          ),
          const Row(children: [
            Text(
              'Font Size',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            CustomDropdownMenu(
              initialSelection: 2,
              firstOption: 'Small',
              secondOption: 'Medium',
              thridption: 'Large',
              fourthOption: 'Huge',
            ),
          ]),
          const SizedBox(
            height: 40,
          ),
          if (index !=
              null) /////////to return to index value to see it again /////////////
            Row(
              children: [
                const Text(
                  'Theme',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                CustomDropdownMenu(
                    onSelected: (value) {
                      BlocProvider.of<ChangeThemeCubit>(context)
                          .changeTheme(value);

                      setState(() {
                        index = value;
                        saveIndex(value);
                      });
                    },
                    initialSelection: index!,
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

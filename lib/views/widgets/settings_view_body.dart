import 'package:Notes/constants.dart';
import 'package:Notes/cubits/change%20font%20size%20cubit/change_font_size_cubit.dart';
import 'package:Notes/cubits/change%20theme%20cubit/change_theme_cubit.dart';
import 'package:Notes/cubits/notes%20cubit/notes_cubit.dart';
import 'package:Notes/helper/responsive.dart';
import 'package:Notes/helper/shared_preference.dart';
import 'package:Notes/views/widgets/custom_drop_down_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsViewBody extends StatefulWidget {
  const SettingsViewBody({super.key});

  @override
  State<SettingsViewBody> createState() => _SettingsViewBodyState();
}

class _SettingsViewBodyState extends State<SettingsViewBody> {
  int? indexTheme, indexFont, indexLayout;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ChangeFontSizeCubit>(context).defaultFont();
    loadInitialIndex();
  }

  Future<void> loadInitialIndex() async {
    indexTheme = await SharedPreferencesHelper.getInt(KThemeKey) ?? 3;
    indexFont = await SharedPreferencesHelper.getInt(KFontKey) ?? 2;
    indexLayout = await SharedPreferencesHelper.getInt(KLayoutKey) ?? 1;
    setState(() {});
  }

  Future<void> saveThemeIndex(int value) async {
    await SharedPreferencesHelper.setInt(KThemeKey, value);
  }

  Future<void> saveFontIndex(int value) async {
    await SharedPreferencesHelper.setInt(KFontKey, value);
  }

  Future<void> saveLayoutIndex(int value) async {
    await SharedPreferencesHelper.setInt(KLayoutKey, value);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ResponsiveSpacing.symmetricPadding(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: ResponsiveSpacing.horizontal(10),
          ),
          Text(
            'Settings',
            style: TextStyle(
              fontSize: ResponsiveSpacing.fontSize(30),
            ),
          ),
          SizedBox(
            height: ResponsiveSpacing.horizontal(40),
          ),
          Text(
            'Style',
            style: TextStyle(
                fontSize: ResponsiveSpacing.fontSize(16),
                color: Color.fromARGB(255, 137, 136, 150)),
          ),
          const Divider(),
          SizedBox(
            height: ResponsiveSpacing.horizontal(20),
          ),
          if (indexFont != null)
            Row(children: [
              Text(
                'Font Size',
                style: TextStyle(
                    fontSize: ResponsiveSpacing.fontSize(18),
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              CustomDropdownMenu(
                onSelected: (value) {
                  BlocProvider.of<ChangeFontSizeCubit>(context)
                      .changeFontSize(value);
                  setState(() {
                    indexFont = value;
                    saveFontIndex(value);
                  });
                },
                initialSelection: indexFont!,
                firstOption: 'Small',
                secondOption: 'Medium',
                thridption: 'Large',
                fourthOption: 'Huge',
              ),
            ]),
          SizedBox(
            height: ResponsiveSpacing.horizontal(20),
          ),
          if (indexTheme !=
              null) /////////to return to index value to see it again /////////////
            Row(
              children: [
                Text(
                  'Theme',
                  style: TextStyle(
                      fontSize: ResponsiveSpacing.fontSize(18),
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                CustomDropdownMenu(
                    onSelected: (value) {
                      BlocProvider.of<ChangeThemeCubit>(context)
                          .changeTheme(value);

                      setState(() {
                        indexTheme = value;
                        saveThemeIndex(value);
                      });
                    },
                    initialSelection: indexTheme!,
                    firstOption: 'Light',
                    secondOption: 'Dark',
                    thridption: 'Default'),
              ],
            ),
          SizedBox(
            height: ResponsiveSpacing.horizontal(20),
          ),
          if (indexLayout != null)
            Row(
              children: [
                Text(
                  'Layout',
                  style: TextStyle(
                      fontSize: ResponsiveSpacing.fontSize(18),
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                CustomDropdownMenu(
                  onSelected: (value) {
                    BlocProvider.of<NotesCubit>(context).changeLayout(value);
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    setState(() {
                      indexLayout = value;
                      saveLayoutIndex(value);
                    });
                  },
                  initialSelection: indexLayout!,
                  firstOption: 'GridView',
                  secondOption: 'ListView',
                ),
              ],
            )
        ],
      ),
    );
  }
}

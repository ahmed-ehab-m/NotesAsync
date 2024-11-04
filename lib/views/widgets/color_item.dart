import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/change%20theme%20cubit/change_theme_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.isActive,
    required this.color,
  });
  final bool isActive;
  final Color color;
  // final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            backgroundColor: BlocProvider.of<ChangeThemeCubit>(context).color,
            radius: 38,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 34,
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 36,
          );
  }
}

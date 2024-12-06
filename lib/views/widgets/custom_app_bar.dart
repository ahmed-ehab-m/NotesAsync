import 'package:Notes/cubits/change%20theme%20cubit/change_theme_cubit.dart';
import 'package:Notes/cubits/change%20theme%20cubit/change_theme_state.dart';
import 'package:Notes/helper/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.title,
      this.checkIcon,
      this.deleteIcon,
      this.pinIcon,
      this.onCheckIconPressed,
      this.onDeleteIconPressed,
      this.onPinIconPressed,
      this.onColorIconPressed,
      this.pinIconColor,
      this.colorIcon});
  final String? title;
  final Widget? checkIcon, deleteIcon, pinIcon, colorIcon;
  final void Function()? onCheckIconPressed,
      onDeleteIconPressed,
      onPinIconPressed,
      onColorIconPressed;
  final Color? pinIconColor;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
      builder: (context, state) {
        return AppBar(
          scrolledUnderElevation: 0.0,
          // leading: backIcon,
          title: Text(
            title ?? '',
            style: TextStyle(
              fontSize: ResponsiveSpacing.fontSize(30),
            ),
          ),
          actions: [
            iconPadding(pinIcon),
            iconPadding(deleteIcon),
            iconPadding(colorIcon),
            iconPadding(checkIcon),
          ],
          backgroundColor:
              BlocProvider.of<ChangeThemeCubit>(context).backgroundColor,
        );
      },
    );
  }

  Padding iconPadding(Widget? icon) {
    return Padding(
      padding: ResponsiveSpacing.onlyPadding(right: 24),
      child: icon ?? Icon(null),
    );
  }

  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

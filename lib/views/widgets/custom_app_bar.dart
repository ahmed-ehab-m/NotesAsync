import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/views/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      this.title,
      this.icon,
      this.onPressed,
      this.showPrefixIcon = false,
      this.deleteIcon,
      this.onDeletePressed,
      this.onPinPressed,
      this.pinIcon,
      this.iconColor,
      this.showColorIcon,
      this.onColorIconPressed});
  final String? title;
  final IconData? icon, deleteIcon, pinIcon;
  final void Function()? onPressed,
      onDeletePressed,
      onPinPressed,
      onColorIconPressed;
  final bool showPrefixIcon;
  final Color? iconColor;
  final bool? showColorIcon;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            if (title == null)
              const Spacer(
                flex: 8,
              ),
            Text(
              title ?? '',
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            if (title != null)
              const Spacer(
                flex: 8,
              ),
            if (showColorIcon != null)
              const Spacer(
                flex: 1,
              ),
            if (showColorIcon != null)
              CustomIcon(
                icon: Icons.color_lens_outlined,
                onPressed: onColorIconPressed,
              ),
            if (pinIcon != null)
              const Spacer(
                flex: 1,
              ),
            if (pinIcon != null)
              CustomIcon(
                icon: pinIcon!,
                onPressed: onPinPressed,
                iconColor: iconColor,
              ),
            if (deleteIcon != null)
              const Spacer(
                flex: 1,
              ),
            if (deleteIcon != null)
              CustomIcon(
                icon: deleteIcon!,
                onPressed: onDeletePressed,
              ),
            const Spacer(),
            if (icon != null)
              CustomIcon(
                icon: icon!,
                onPressed: onPressed,
              ),
          ],
        ),
        if (showPrefixIcon)
          Positioned(
            top: 10,
            child: CustomIcon(
              icon: FontAwesomeIcons.angleLeft,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
      ],
    );
  }
}

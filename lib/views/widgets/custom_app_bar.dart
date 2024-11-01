import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/views/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.title,
      this.icon,
      this.onPressed,
      this.showPrefixIcon = false,
      this.deleteIcon,
      this.onDeletePressed,
      this.onPinPressed,
      this.pinIcon,
      this.iconColor});
  final String title;
  final IconData? icon, deleteIcon, pinIcon;
  final void Function()? onPressed, onDeletePressed, onPinPressed;
  final bool showPrefixIcon;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: showPrefixIcon ? 50 : 0,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            if (pinIcon != null)
              const SizedBox(
                width: 190,
              ),
            if (pinIcon != null)
              CustomIcon(
                icon: pinIcon!,
                onPressed: onPinPressed,
                iconColor: iconColor,
              ),
            if (deleteIcon != null)
              const SizedBox(
                width: 20,
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

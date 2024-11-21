import 'package:flutter/material.dart';

class CustomTestAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTestAppBar(
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
    return AppBar(
      // leading: backIcon,
      title: Text(
        title ?? '',
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      actions: [
        pinIcon ?? Icon(null),
        deleteIcon ?? Icon(null),
        colorIcon ?? Icon(null),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: checkIcon ?? Icon(null),
        ),
      ],
      backgroundColor: Colors.black,
    );
  }

  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

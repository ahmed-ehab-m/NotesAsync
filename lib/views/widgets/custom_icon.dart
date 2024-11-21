import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon(
      {super.key, required this.icon, this.onPressed, this.iconColor});
  final IconData icon;
  final void Function()? onPressed;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      color: iconColor,
      onPressed: onPressed,
    );
  }
}

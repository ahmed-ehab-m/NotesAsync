import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon(
      {super.key,
      required this.icon,
      this.onPressed,
      this.iconColor,
      this.iconSize});
  final IconData icon;
  final void Function()? onPressed;
  final Color? iconColor;
  final double? iconSize;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        icon,
        size: iconSize,
        color: iconColor,
      ),
      onTap: onPressed,
    );
  }
}

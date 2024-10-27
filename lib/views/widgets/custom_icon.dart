import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon, this.onPressed});
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 28,
        color: kSecondaryColor,
      ),
    );
  }
}

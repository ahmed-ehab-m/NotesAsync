import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon, this.onPressed});
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromRGBO(255, 255, 255, 1).withOpacity(0.05),
      ),
      width: 46,
      height: 46,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 28,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromRGBO(255, 255, 255, 1).withOpacity(0.05),
      ),
      width: 46,
      height: 46,
      child: Icon(
        icon,
        size: 28,
      ),
    );
  }
}

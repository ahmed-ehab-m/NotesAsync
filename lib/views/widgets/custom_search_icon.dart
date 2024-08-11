import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key});

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
        Icons.search,
        size: 28,
      ),
    );
  }
}

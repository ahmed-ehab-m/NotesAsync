import 'package:Notes/constants.dart';
import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.isActive,
    required this.color,
  });
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? Container(
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: color,
              border: Border.all(
                color: kPrimaryColor,
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: color,
                ),
                width: 100,
                child: Image.asset(
                  'assets/images/Multiline Text (1).png',
                ),
              ),
            ),
          )
        : Container(
            padding: EdgeInsets.all(18),
            width: 100,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              'assets/images/Multiline Text (1).png',
            ),
          );
  }
}

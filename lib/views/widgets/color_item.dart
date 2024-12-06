import 'package:Notes/constants.dart';
import 'package:Notes/helper/responsive.dart';
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
            width: ResponsiveSpacing.vertical(100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ResponsiveSpacing.value(18)),
              color: color,
              border: Border.all(
                color: kPrimaryColor,
                width: ResponsiveSpacing.value(2),
              ),
            ),
            child: Padding(
              padding: ResponsiveSpacing.allPadding(18),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(ResponsiveSpacing.value(18)),
                  color: color,
                ),
                width: ResponsiveSpacing.vertical(100),
                child: Image.asset(
                  'assets/images/Multiline Text (1).png',
                ),
              ),
            ),
          )
        : Container(
            padding: ResponsiveSpacing.allPadding(18),
            width: ResponsiveSpacing.vertical(100),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(ResponsiveSpacing.value(12)),
            ),
            child: Image.asset(
              'assets/images/Multiline Text (1).png',
            ),
          );
  }
}

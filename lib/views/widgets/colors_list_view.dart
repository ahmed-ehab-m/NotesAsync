import 'package:Notes/constants.dart';
import 'package:Notes/helper/responsive.dart';
import 'package:Notes/views/widgets/color_item.dart';
import 'package:flutter/material.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({
    super.key,
    required this.onChangeColor,
  });
  final void Function(Color) onChangeColor;
  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ResponsiveSpacing.horizontal(140),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: ResponsiveSpacing.symmetricPadding(
                horizontal: 6.0, vertical: 8),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;

                setState(() {});
                widget.onChangeColor(kColors[index]);
              },
              child: ColorItem(
                isActive: currentIndex == index,
                color: kColors[index],
              ),
            ),
          );
        },
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

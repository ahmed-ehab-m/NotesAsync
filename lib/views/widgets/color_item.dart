import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.isActive,
    required this.color,
  });
  final bool isActive;
  final Color color;
  // final Color backgroundColor;
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
                // child: const Icon(
                //   FontAwesomeIcons.bars,
                //   size: 40,
                //   color: kSecondaryColor,
                // ),
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

    // ? CircleAvatar(
    //     backgroundColor: BlocProvider.of<ChangeThemeCubit>(context)
    //         .circleColor
    //         .withOpacity(0.8),
    //     radius: 38,
    //     child: CircleAvatar(
    //       backgroundColor: color,
    //       radius: 34,
    //     ),
    //   )
    // : CircleAvatar(
    //     backgroundColor: color,
    //     radius: 36,
    //   );
  }
}

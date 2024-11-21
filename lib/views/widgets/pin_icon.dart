import 'package:flutter/material.dart';

class pinIcon extends StatelessWidget {
  const pinIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 8,
      right: 30,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Padding(
                padding: EdgeInsets.all(8),
                child: Image.asset('assets/images/Pin.png')),
            // child: Icon(CupertinoIcons.pin, color: kPrimaryColor),
          ),
        ],
      ),
    );
  }
}

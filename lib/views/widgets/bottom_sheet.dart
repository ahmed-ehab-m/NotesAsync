import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowBottomSheet extends StatelessWidget {
  const ShowBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, top: 10, right: 24),
      height: 55,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Column(
              children: [
                Icon(
                  CupertinoIcons.pin,
                ),
                Text('Pin'),
              ],
            ),
          ),
          SizedBox(
            width: 24,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Column(
              children: [
                Icon(
                  CupertinoIcons.folder,
                ),
                Text('add to folder'),
              ],
            ),
          ),
          SizedBox(
            width: 24,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Column(
              children: [
                Icon(
                  Icons.delete_outline,
                ),
                Text('Delete'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

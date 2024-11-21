import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/views/widgets/color_item.dart';

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
      height: 140,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                BlocProvider.of<AddNoteCubit>(context).color = kColors[index];

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

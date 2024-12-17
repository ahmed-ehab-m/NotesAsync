import 'package:Notes/constants.dart';
import 'package:Notes/cubits/notes%20cubit/notes_cubit.dart';
import 'package:Notes/cubits/notes%20cubit/notes_state.dart';
import 'package:Notes/helper/pie_theme.dart';
import 'package:Notes/models/note_model.dart';
import 'package:Notes/views/widgets/grid_note_item.dart';
import 'package:Notes/views/widgets/list_note_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pie_menu/pie_menu.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({
    super.key,
    required this.noteModel,
    required this.onPressed,
    required this.onSelectPin,
    required this.status,
    required this.showPin,
    required this.textTitle,
    required this.textSubTitle,
  });
  final NoteModel noteModel;
  final void Function()? onPressed;
  final dynamic Function() onSelectPin;
  final String status;
  final bool showPin;

  final Widget textTitle;
  final Widget textSubTitle;

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(builder: (context, state) {
      return BlocProvider.of<NotesCubit>(context).layout == KGridView
          ? GridNoteItem(
              noteModel: noteModel,
              textTitle: textTitle,
              textSubTitle: textSubTitle,
              onSelectPin: onSelectPin,
              status: status,
              showPin: showPin,
              // pieTheme: pieTheme(context),
              pieTheme: PieThNoteeme.pieTheme(context, noteModel.color),
            )
          : ListNoteItem(
              noteModel: noteModel,
              textTitle: textTitle,
              textSubTitle: textSubTitle,
              onSelectPin: onSelectPin,
              status: status,
              showPin: showPin,
              pieTheme: PieThNoteeme.pieTheme(context, noteModel.color),
            );
    });
  }

  PieTheme pieTheme(BuildContext context) {
    return PieTheme(
        tooltipTextStyle: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black),
        pointerColor: Color(noteModel.color),
        overlayColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.black.withAlpha(200)
            : Colors.white.withAlpha(200),
        buttonThemeHovered: const PieButtonTheme(
            backgroundColor: kPrimaryColor, iconColor: Colors.white),
        buttonTheme: const PieButtonTheme(
            backgroundColor: Colors.white, iconColor: kPrimaryColor));
  }
}

import 'package:Notes/constants.dart';
import 'package:Notes/cubits/notes%20cubit/notes_cubit.dart';
import 'package:Notes/helper/responsive.dart';
import 'package:Notes/models/note_model.dart';
import 'package:Notes/views/edit_note_view.dart';
import 'package:Notes/views/widgets/custom_icon.dart';
import 'package:Notes/views/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pie_menu/pie_menu.dart';

class ListNoteItem extends StatelessWidget {
  const ListNoteItem(
      {super.key,
      required this.noteModel,
      required this.onSelectPin,
      required this.status,
      required this.showPin,
      required this.textTitle,
      required this.textSubTitle,
      required this.pieTheme});
  final NoteModel noteModel;
  final dynamic Function() onSelectPin;
  final String status;
  final bool showPin;
  final Widget textTitle;
  final Widget textSubTitle;
  final PieTheme? pieTheme;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(ResponsiveSpacing.value(16))),
        alignment: Alignment.centerRight,
        padding: ResponsiveSpacing.symmetricPadding(horizontal: 20),
        child: Icon(
          HugeIcons.strokeRoundedDelete02,
          color: Colors.white,
          size: ResponsiveSpacing.value(40),
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        noteModel.delete();
        BlocProvider.of<NotesCubit>(context).fetchAllNotes();

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
              CustomSnackBar().buildSnackBar(message: 'note deleted'));
      },
      key: Key('Key'),
      child: PieMenu(
        theme: pieTheme,
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  duration: const Duration(milliseconds: 700),
                  type: PageTransitionType.scale,
                  alignment: Alignment.center,
                  child: EditNoteView(
                    noteModel: noteModel,
                  )));
        },
        actions: [
          PieAction(
              tooltip: Text(status),
              onSelect: onSelectPin,
              child: noteModel.pin
                  ? const Icon(HugeIcons.strokeRoundedPinOff)
                  : const Icon(HugeIcons.strokeRoundedPin)),
          PieAction(
            tooltip: const Text(
              'Delete',
            ),
            onSelect: () {
              noteModel.delete();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();

              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                    CustomSnackBar().buildSnackBar(message: 'note deleted'));
            },
            child: const Icon(
                HugeIcons.strokeRoundedDelete02), // Can be any widget
          ),
        ],
        child: Stack(
          children: [
            Container(
              padding: ResponsiveSpacing.allPadding(16),
              decoration: BoxDecoration(
                  color: Color(noteModel.color),
                  borderRadius: BorderRadius.circular(
                    ResponsiveSpacing.value(16),
                  )),
              // child: Text('hello'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textTitle,
                  Padding(
                      padding: ResponsiveSpacing.onlyPadding(
                          left: 10, top: 10, bottom: 10),
                      child: textSubTitle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        noteModel.date,
                        style: TextStyle(
                          fontSize: ResponsiveSpacing.fontSize(12),
                        ),
                      ),
                      SizedBox(
                        width: ResponsiveSpacing.vertical(10),
                      ),
                      if (showPin)
                        CustomIcon(
                          icon: HugeIcons.strokeRoundedPin,
                          iconColor: kPrimaryColor,
                          onPressed: () {},
                          iconSize: ResponsiveSpacing.value(15),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

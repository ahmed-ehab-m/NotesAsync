import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/pin%20_notes_cubit/pin_notes_cubit.dart';
import 'package:notes_app/cubits/pin%20_notes_cubit/pin_notes_state.dart';
import 'package:notes_app/models/note_model.dart';

class CustomPinNotesView extends StatelessWidget {
  const CustomPinNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PinNotesCubit, PinNotesState>(
      builder: (context, state) {
        List<NoteModel> pinNotes =
            BlocProvider.of<PinNotesCubit>(context).pinNotes ?? [];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // عدد الأعمدة في الشبكة
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.6,
            ),
            itemCount: pinNotes.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                // child: NoteItem(
                //   noteModel: pinNotes[index],
                //   // showOptions: showOptions,
                // ),
              );
            },
          ),
        );
      },
    );
  }
}

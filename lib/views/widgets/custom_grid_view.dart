import 'package:Notes/models/note_model.dart';
import 'package:Notes/views/widgets/custom_note_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    super.key,
    required this.notes,
    required this.togglePin,
    required this.buildHighlightedText,
  });
  final List<NoteModel> notes;

  final void Function(int) togglePin;
  final Widget Function(String text, String type) buildHighlightedText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: MasonryGridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        itemCount: notes.length,
        itemBuilder: (context, index) {
          // return Stack(
          //   children: [
          //     Container(
          //       padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          //       decoration: BoxDecoration(
          //           color: Colors.red, borderRadius: BorderRadius.circular(16)),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text('hoppa'),
          //           // const Spacer(),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.start,
          //             children: [
          //               Text(
          //                 'jj',
          //                 style: const TextStyle(
          //                   // color: Colors.white70,
          //                   fontSize: 12,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // );
          return CustomNoteItem(
            noteModel: notes[index],
            onPressed: () => togglePin(index),
            onSelectPin: () {
              togglePin(index);
            },
            status: notes[index].pin ? 'Unpin' : 'Pin',
            showPin: notes[index].pin ? true : false,
            textTitle: buildHighlightedText(notes[index].title, 'title'),
            textSubTitle:
                buildHighlightedText(notes[index].subtitle, 'subTitle'),
          );
        },
      ),
    );
  }
  //   return GridView.builder(
  //     shrinkWrap: true,
  //     physics: NeverScrollableScrollPhysics(),
  //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //       crossAxisCount: 2,
  //       crossAxisSpacing: 8.0,
  //       mainAxisSpacing: 8.0,
  //       childAspectRatio: 0.6,
  //     ),
  //     itemCount: notes.length,
  //     padding: EdgeInsets.zero,
  //     itemBuilder: (context, index) {
  //       return Padding(
  //         padding: const EdgeInsets.symmetric(vertical: 4),
  //         child: CustomNoteItem(
  //           // showOptions: showOptions,
  //           noteModel: notes[index],
  //           onPressed: () => togglePin(index),
  //           onSelectPin: () {
  //             togglePin(index);
  //           },
  //           status: notes[index].pin ? 'Unpin' : 'Pin',
  //           showPin: notes[index].pin ? true : false,

  //           textTitle: buildHighlightedText(notes[index].title, 'title'),
  //           textSubTitle:
  //               buildHighlightedText(notes[index].subtitle, 'subTitle'),
  //         ),
  //       );
  //     },
  //   );

  // }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/views/add_note_view.dart';
import 'package:notes_app/views/settings_view.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_icon.dart';
import 'package:notes_app/views/widgets/notes_view_body.dart';
import 'package:page_animation_transition/animations/right_to_left_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pie_menu/pie_menu.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  final FocusNode _searchFocusNode = FocusNode();
  @override
  // void initState() {
  //   _searchFocusNode
  //   super.initState();
  // }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PieCanvas(
      child: GestureDetector(
        onTap: () {
          _searchFocusNode.unfocus();
        },
        child: Scaffold(
          appBar: CustomAppBar(
            title: 'My Notes',
            checkIcon: CustomIcon(
              icon: HugeIcons.strokeRoundedSlidersHorizontal,
              // iconColor: Colors.white,
              onPressed: () {
                _searchFocusNode.unfocus();

                Navigator.of(context).push(PageAnimationTransition(
                    page: const SettingsView(),
                    pageAnimationType: RightToLeftTransition()));
              },
            ),
          ),
          body: NotesViewBody(
            searchFocusNode: _searchFocusNode,
          ),
          floatingActionButton: FloatingActionButton(
            elevation: 0,
            shape: const CircleBorder(),
            backgroundColor: kPrimaryColor,
            onPressed: () {
              _searchFocusNode.unfocus();

              Navigator.push(
                  context,
                  PageTransition(
                      duration: const Duration(milliseconds: 600),
                      type: PageTransitionType.scale,
                      alignment: Alignment.bottomRight,
                      child: const AddNoteView()));
            },
            child: const Icon(
              FontAwesomeIcons.plus,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

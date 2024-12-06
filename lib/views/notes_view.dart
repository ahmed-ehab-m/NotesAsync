import 'package:Notes/constants.dart';
import 'package:Notes/helper/responsive.dart';
import 'package:Notes/views/add_note_view.dart';
import 'package:Notes/views/settings_view.dart';
import 'package:Notes/views/widgets/custom_app_bar.dart';
import 'package:Notes/views/widgets/custom_icon.dart';
import 'package:Notes/views/widgets/notes_view_body.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hugeicons/hugeicons.dart';
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
          appBar: noteAppBar(context),
          body: NotesViewBody(
            searchFocusNode: _searchFocusNode,
          ),
          floatingActionButton: Transform.scale(
            scale: 1.2,
            child: FloatingActionButton(
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
              child: Icon(
                FontAwesomeIcons.plus,
                color: Colors.white,
                size: ResponsiveSpacing.value(30),
              ),
            ),
          ),
        ),
      ),
    );
  }

  CustomAppBar noteAppBar(BuildContext context) {
    return CustomAppBar(
      title: 'My Notes',
      checkIcon: CustomIcon(
        icon: HugeIcons.strokeRoundedSlidersHorizontal,
        onPressed: () {
          _searchFocusNode.unfocus();
          Navigator.of(context).push(PageAnimationTransition(
              page: const SettingsView(),
              pageAnimationType: RightToLeftTransition()));
        },
      ),
    );
  }
}

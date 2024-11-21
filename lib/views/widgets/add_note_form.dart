import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/notes%20cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  Color? textFieldColor;
  // bool pin = true;
  // void togglePin() {
  //   setState(() {
  //     pin = !pin;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          // const SizedBox(
          //   height: 55,
          // ),
          // CustomAppBar(
          //     title: '',
          //     onColorIconPressed: () {
          //       showModalBottomSheet(
          //           barrierColor: Colors.transparent,
          //           isScrollControlled: true,
          //           backgroundColor: Colors.transparent,
          //           context: context,
          //           builder: (context) {
          //             // final addNoteCubit =
          //             //     BlocProvider.of<AddNoteCubit>(this.context);
          //             return Padding(
          //               padding: EdgeInsets.only(left: 20, right: 20),
          //               child: ColorsListView(
          //                 onChangeColor: (color) {
          //                   setState(() {
          //                     textFieldColor = color;
          //                   });
          //                 },
          //               ),
          //             );
          //           });
          //     },
          //     // pinIcon: pin ? Icons.push_pin : Icons.push_pin_outlined,
          //     // iconColor: pin
          //     //     ? kPrimaryColor
          //     //     : Theme.of(context).brightness == Brightness.dark
          //     //         ? Colors.white
          //     //         : Colors.black,
          //     // onPinPressed: () {
          //     //   togglePin();
          //     // },
          //     showPrefixIcon: true,
          //     showColorIcon: true,
          //     icon: FontAwesomeIcons.check,
          //     onPressed: () {
          //       validation(context);
          //     }),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
              color: textFieldColor,
              onSaved: (value) {
                title = value;
              },
              text: 'Title',
              fontSize: 24),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Row(children: [
              Text(
                DateFormat('MMMM dd, hh:mm a').format(DateTime.now()),
                style: TextStyle(fontSize: 12),
              )
            ]),
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            color: textFieldColor,
            autofocus: true,
            text: 'Start typing',
            maxLines: 20,
            onSaved: (value) {
              subTitle = value;
            },
          ),
          const SizedBox(
            height: 32,
          ),
          // const ColorsListView(),
          // const SizedBox(
          //   height: 32,
          // ),
          // BlocBuilder<AddNoteCubit, AddNoteState>(
          //   builder: (context, state) {
          //     return CustomButton(
          //       isLoading: state is AddNoteLoading ? true : false,
          //       onTap: () {
          //         validation(context);
          //       },
          //     );
          //   },
          // ),
          // const SizedBox(
          //   height: 16,
          // ),
        ],
      ),
    );
  }

  void validation(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var currnetDate = DateTime.now();
      var formattedCurrntDate =
          DateFormat('MMM dd hh:mm a').format(currnetDate);
      var noteModel = NoteModel(
          title: title!,
          subtitle: subTitle!,
          date: formattedCurrntDate,
          color: Colors.blue.value,
          pin: false);

      BlocProvider.of<AddNoteCubit>(context).addNote((noteModel));
      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}

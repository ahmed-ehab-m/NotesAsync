import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/change%20font%20size%20cubit/change_font_size_cubit.dart';
import 'package:notes_app/cubits/change%20theme%20cubit/change_theme_cubit.dart';
import 'package:notes_app/cubits/change%20theme%20cubit/change_theme_state.dart';
import 'package:notes_app/cubits/notes%20cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'package:notes_app/views/notes_view.dart';

void main() async {
  Bloc.observer = SimpleBlocOpserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(const NotesApp());
}

class NotesApp extends StatefulWidget {
  const NotesApp({super.key});

  @override
  State<NotesApp> createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddNoteCubit>(
          create: (context) => AddNoteCubit(),
        ),
        BlocProvider<ChangeThemeCubit>(
          create: (context) => ChangeThemeCubit(),
        ),
        BlocProvider<NotesCubit>(
          create: (context) => NotesCubit(),
        ),
        BlocProvider<ChangeFontSizeCubit>(
          create: (context) => ChangeFontSizeCubit(),
        ),
      ],
      child: BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: BlocProvider.of<ChangeThemeCubit>(context).theme,
              scaffoldBackgroundColor:
                  BlocProvider.of<ChangeThemeCubit>(context).backgroundColor,
              fontFamily: 'Poppins',
            ),
            home: const NotesView(),
          );
        },
      ),
    );
  }
}

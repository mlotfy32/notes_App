import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notesapp/Add%20Note_Cubit/notes_cubit.dart';
import 'package:notesapp/Simble%20observer.dart';
import 'package:notesapp/Views/notes_view.dart';
import 'package:notesapp/models/Note%20Model.dart';

void main() async {
  Bloc.observer = Simple();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<Note_Model>('Notes_Box');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Poppins',
          brightness: Brightness.dark,
        ),
        debugShowCheckedModeBanner: false,
        home: Notes_View(),
      ),
    );
  }
}

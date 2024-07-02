import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/widgets/appbar.dart';

import '../Add Note_Cubit/notes_cubit.dart';
import 'NotesListview.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        children: [
          CustomeAppBar(
            title: 'Notes',
            icon: Icons.search,
            w: 207,
          ),
          Expanded(child: NotesListView())
        ],
      ),
    );
  }
}

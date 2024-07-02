import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/Add%20Note_Cubit/notes_cubit.dart';

import '../models/Note Model.dart';
import 'custome note item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<Note_Model> notes =
            BlocProvider.of<NotesCubit>(context).notes ?? [];
        return ListView.builder(
            itemBuilder: (context, index) => NoteItem(
                  notes: notes[index],
                ),
            itemCount: notes.length);
      },
    );
  }
}

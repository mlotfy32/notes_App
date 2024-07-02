import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/Note Model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
Color color=Color(0xff00291a);
  addNotes(Note_Model notes) async {
    emit(AddNoteLoading());
    try {
      notes.color=color.value;
      var notesBox = Hive.box<Note_Model>('Notes_Box');
      await notesBox.add(notes);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailuer(e.toString()));
    }
  }
}

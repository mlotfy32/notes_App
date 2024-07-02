import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/Note Model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<Note_Model>? notes;

  fetchNotes() {
    var notesBox = Hive.box<Note_Model>('Notes_Box');
    notes = notesBox.values.toList();
    emit(NotesSuccess());
  }
}

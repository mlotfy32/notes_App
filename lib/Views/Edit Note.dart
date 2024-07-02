import 'package:flutter/material.dart';
import 'package:notesapp/models/Note%20Model.dart';

import '../widgets/EditNoteBody.dart';

class EditNote extends StatelessWidget {
  const EditNote({super.key, required this.note});
  final Note_Model note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: EditNoteBody(
      note: note,
    ));
  }
}

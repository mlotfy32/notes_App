import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/Add%20Note_Cubit/notes_cubit.dart';
import 'package:notesapp/widgets/ColorsList.dart';
import 'package:notesapp/widgets/text%20field.dart';

import '../models/Note Model.dart';
import 'appbar.dart';

class EditNoteBody extends StatelessWidget {
  const EditNoteBody({super.key, required this.note});

  final Note_Model note;

  @override
  Widget build(BuildContext context) {
    String? newtitle, newcontent;
    GlobalKey<FormState> formkey = GlobalKey();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 45.0, horizontal: 15),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              CustomeAppBar(
                title: 'Edit Note',
                w: 170,
                icon: Icons.check,
                onpress: () {
                  formkey.currentState!.save();
                  note.title = newtitle ?? note.title;
                  note.content = newcontent ?? note.content;
                  note.save();
                  BlocProvider.of<NotesCubit>(context).fetchNotes();
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFeild(
                onchange: (val) {
                  newtitle = val;
                },
                hint: note.title,
              ),
              SizedBox(
                height: 20,
              ),
              TextFeild(
                onchange: (val) {
                  newcontent = val;
                },
                hint: note.content,
                maxline: 5,
              ),
              SizedBox(
                height: 20,
              ),
              ColorList(),
            ],
          ),
        ),
      ),
    );
  }
}

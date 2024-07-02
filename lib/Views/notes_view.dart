import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/AddNote.dart';
import '../widgets/notes view body.dart';

class Notes_View extends StatefulWidget {
  const Notes_View({super.key});

  @override
  State<Notes_View> createState() => _Notes_ViewState();
}

class _Notes_ViewState extends State<Notes_View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {
          showModalBottomSheet(
              //backgroundColor: Colors.blue.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              )),
              context: context,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: 8.0,
                      right: 8,
                      top: 10,
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddNoteForm(),
                );
              },
              isScrollControlled: true);
        },
        child: Icon(
          Icons.add,
          size: 25,
        ),
      ),
      body: SafeArea(child: NotesViewBody()),
    );
  }
}

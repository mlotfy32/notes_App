import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:notesapp/Add%20Note_Cubit/notes_cubit.dart';
import 'package:notesapp/Views/Edit%20Note.dart';
import 'package:notesapp/models/Note%20Model.dart';

class NoteItem extends StatelessWidget {
  NoteItem({super.key, required this.notes});

  final Note_Model notes;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditNote(
                      note: notes,
                    )));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(notes.color)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 10),
                child: Text(
                  notes.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  AwesomeDialog(
                      context: context,
                      body: Container(
                        padding: EdgeInsets.only(top: 5, left: 10),
                        width: 240,
                        height: 120,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Are you sure ',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    notes.delete();
                                    BlocProvider.of<NotesCubit>(context)
                                        .fetchNotes();
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    height: 60,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.teal),
                                    child: Center(
                                      child: Text(
                                        'Confirm',
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                        margin: EdgeInsets.only(right: 10),
                                        height: 60,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Colors.blue),
                                        child: Center(
                                          child: Text(
                                            'Cancel',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )))
                              ],
                            )
                          ],
                        ),
                      )).show();
                },
                icon: Icon(
                  FontAwesomeIcons.trash,
                  color: Colors.red.withOpacity(0.5),
                ),
              ),
              subtitle: Text(
                notes.content,
                style: TextStyle(
                    fontSize: 17, color: Colors.white.withOpacity(0.8)),
              ),
            ),
            Text(
              notes.date,
              style: TextStyle(color: Colors.white.withOpacity(0.5)),
            )
          ],
        ),
      ),
    );
  }
}

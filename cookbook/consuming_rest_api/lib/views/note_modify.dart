import 'package:flutter/material.dart';
// this same view is used for both create and update

class NoteModify extends StatelessWidget {
  final String? noteID;
  bool get isEditing => noteID != null;

  //noteID is not a required parameter
  NoteModify({Key? key, this.noteID}) : super(key: key);

  // NoteModify({this.noteID}); //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(noteID == null ? 'Create note' : 'Edit note')),
      appBar: AppBar(title: Text(isEditing ? 'Edit note' : 'Create note')),
      body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              const TextField(
                decoration: InputDecoration(hintText: 'Note title'),
              ),
              Container(
                height: 16,
              ),
              const TextField(
                decoration: InputDecoration(hintText: 'Note content'),
              ),
              Container(
                height: 32,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // if (isEditing) {
                    //   //update the note in api
                    // } else {
                    //   //create the note in api
                    // }

                    Navigator.of(context).pop();
                  },
                  child: const Text('Submit'),
                ),
              )
            ],
          )),
    );
  }
}

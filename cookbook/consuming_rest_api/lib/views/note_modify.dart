import 'package:consuming_rest_api/models/note.dart';
import 'package:consuming_rest_api/models/note_manipulation.dart';
import 'package:consuming_rest_api/services/notes_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
// this same view is used for both create and update

class NoteModify extends StatefulWidget {
  final String? noteID;
  NoteModify({Key? key, this.noteID}) : super(key: key);

  @override
  State<NoteModify> createState() => _NoteModifyState();
}

class _NoteModifyState extends State<NoteModify> {
  bool get isEditing => widget.noteID != null;

  NotesService get service => GetIt.I<NotesService>();
  String? errorMessage;
  Note? note;

  bool _isLoading = false;
  // private field could be final
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (isEditing) {
      setState(() {
        _isLoading = true;
      });

      service.getNote(widget.noteID!).then((response) {
        setState(() {
          _isLoading = false;
        });
        if (response.error == true) {
          errorMessage = response.errorMessage ?? 'An error occured';
        }
        note = response.data;
        print(response.data);
        print(response.error);
        // note = response.data ?? ;
        // var len = foo?.length ?? 0; // Provide a default value if foo was null.

        _titleController.text = note!.noteTitle!;
        _contentController.text = note!.noteContent!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(noteID == null ? 'Create note' : 'Edit note')),
      appBar: AppBar(title: Text(isEditing ? 'Edit note' : 'Create note')),
      body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: <Widget>[
                    TextField(
                      controller: _titleController,
                      decoration: const InputDecoration(hintText: 'Note title'),
                    ),
                    Container(
                      height: 16,
                    ),
                    TextField(
                      controller: _contentController,
                      decoration:
                          const InputDecoration(hintText: 'Note content'),
                    ),
                    Container(
                      height: 32,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 35,
                      child: ElevatedButton(
                        child: const Text('Submit',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () async {
                          if (isEditing) {
                            //update the note in api
                          } else {
                            //create the note in api
                            setState(() {
                              _isLoading = true;
                            });

                            final note = NoteManipulation(
                                noteTitle: _titleController.text,
                                noteContent: _contentController.text);
                            final result = await service.createNote(note);

                            setState(() {
                              _isLoading = false;
                            });

                            final title = 'Done';
                            final text = result.error == true
                                ? (result.errorMessage ?? 'An error occured')
                                : 'Your note was created';

                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: Text(title),
                                content: Text(text),
                                actions: <Widget>[
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('OK'))
                                ],
                              ),
                            ).then((data) {
                              if (result.data == true) {
                                Navigator.of(context).pop();
                              }
                            });
                          }
                        },
                      ),
                    )
                  ],
                )),
    );
  }
}

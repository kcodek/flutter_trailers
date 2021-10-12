import 'package:consuming_rest_api/models/note_for_listing.dart';
import 'package:consuming_rest_api/views/note_modify.dart';
import 'package:flutter/material.dart';

class NoteList extends StatelessWidget {
  NoteList({Key? key}) : super(key: key);

  final notes = [
    NoteForListing(
        noteID: "1",
        createDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now(),
        noteTitle: "Note 1"),
    NoteForListing(
        noteID: "2",
        createDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now(),
        noteTitle: "Note 2"),
    NoteForListing(
        noteID: "3",
        createDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now(),
        noteTitle: "Note 3")
  ];

  //helper function to format the datetime
  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of notes'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const NoteModify()));
          },
          child: const Icon(Icons.add)),
      body: ListView.separated(
        itemCount: notes.length,
        separatorBuilder: (_, __) => const Divider(
          height: 1,
          color: Colors.green,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              notes[index].noteTitle,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            subtitle: Text(
                'Last edited on ${formatDateTime(notes[index].latestEditDateTime)}'),
          );
        },
      ),
    );
  }
}
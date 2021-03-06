import 'package:consuming_rest_api/models/api_response.dart';
import 'package:consuming_rest_api/models/note_for_listing.dart';
import 'package:consuming_rest_api/services/notes_service.dart';
import 'package:consuming_rest_api/views/note_delete.dart';
import 'package:consuming_rest_api/views/note_modify.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class NoteList extends StatefulWidget {
  NoteList({Key? key}) : super(key: key);

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  NotesService get service => GetIt.I<NotesService>();

  //null safety
  late APIResponse<List<NoteForListing>> _apiResponse;
  bool _isloading = false;

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  void initState() {
    _fetchNotes();
    super.initState();
  }

  void _fetchNotes() async {
    setState(() {
      _isloading = true;
    });
    _apiResponse = await service.getNotesList();

    setState(() {
      _isloading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
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
                .push(MaterialPageRoute(builder: (_) => NoteModify()))
                .then((_) {
              // refreshes & fetches the new list of updated/created notes
              _fetchNotes();
            });
          },
          child: const Icon(Icons.add)),
      body: Builder(
        builder: (_) {
          if (_isloading) {
            return const CircularProgressIndicator();
          }
          // A nullable expression can't be used as a condition.
          if (_apiResponse.error == true) {
            return Center(child: Text(_apiResponse.errorMessage!));
          }
          return ListView.separated(
            itemCount: _apiResponse.data!.length,
            separatorBuilder: (_, __) => const Divider(
              height: 1,
              color: Colors.green,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: ValueKey(_apiResponse.data![index].noteID),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  // // Exception A dismissed Dismissible widget is still part of the tree
                  // // Make sure to implement the onDismissed handler and to immediately remove the Dismissible widget from
                  // // the application once that handler has fired.
                  // setState(() {
                  //   notes.removeAt(index);
                  // });
                },
                confirmDismiss: (direction) async {
                  final result = await showDialog(
                      context: context, builder: (_) => const NoteDelete());
                  if (result) {
                    final deleteResult = await service
                        .deleteNote(_apiResponse.data![index].noteID!);

                    var message = '';
                    if (deleteResult.data == true) {
                      message = 'The note was deleted successfully';
                    } else {
                      message =
                          deleteResult.errorMessage ?? 'An error occurred';
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                        duration: const Duration(milliseconds: 1000),
                      ),
                    );
                    return deleteResult.data ?? false;
                  }
                  return result;
                },
                background: Container(
                  color: Colors.red,
                  padding: const EdgeInsets.only(left: 16),
                  child: const Align(
                    child: Icon(Icons.delete, color: Colors.white),
                    alignment: Alignment.centerLeft,
                  ),
                ),
                child: ListTile(
                  title: Text(
                    _apiResponse.data![index].noteTitle!,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  subtitle: Text(
                      'Last edited on ${formatDateTime(_apiResponse.data![index].latestEditDateTime)}'),
                  // 'Last edited on ${formatDateTime(_apiResponse.data[index].latestEditDateTime ?? _apiResponse.data[index].createDateTime)}'),
                  onTap: () {
                    // based on noteId
                    Navigator.of(context)
                        .push(MaterialPageRoute(
                            // specify the name of the parameter('noteID') as it's a not a required param
                            builder: (_) => NoteModify(
                                noteID: _apiResponse.data![index].noteID)))
                        .then((data) => _fetchNotes());
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

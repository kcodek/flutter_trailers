import 'package:consuming_rest_api/models/api_response.dart';
import 'package:consuming_rest_api/models/note.dart';
import 'package:consuming_rest_api/models/note_for_listing.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; //for json

class NotesService {
  static const API = 'https://tq-notes-api-jkrgrdggbq-el.a.run.app';
  // https://tq-notes-api-jkrgrdggbq-el.a.run.app/swagger/index.html
  static const headers = {'apiKey': 'd85ba821-6d16-42af-851a-0cb26d6f4dff'};

  Future<APIResponse<Note>> getNote(String noteID) {
    return http
        .get(Uri.parse(API + '/notes' + noteID), headers: headers)
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final note = Note(
            noteID: jsonData['noteID'],
            noteTitle: jsonData['noteTitle'],
            noteContent: jsonData['noteContent'],
            createDateTime: DateTime.parse(jsonData['createDatetime']),
            latestEditDateTime: jsonData['latestEditDateTime'] != null
                ? DateTime.parse(jsonData['latestEditDateTime'])
                : null);
        return APIResponse<Note>(data: note);
      }
      return APIResponse<Note>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
            APIResponse<Note>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<List<NoteForListing>>> getNotesList() {
    final notes = <NoteForListing>[];
    return http.get(Uri.parse(API + '/notes'), headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        for (var item in jsonData) {
          final note = NoteForListing(
              noteID: item['noteID'],
              noteTitle: item['noteTitle'],
              createDateTime: DateTime.parse(item['createDateTime']),
              latestEditDateTime: item['latestEditDateTime'] != null
                  ? DateTime.parse(item['latestEditDateTime'])
                  : null);
          notes.add(note);
        }
        return APIResponse<List<NoteForListing>>(data: notes);
      }
      return APIResponse<List<NoteForListing>>(
          data: notes, error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<List<NoteForListing>>(
        data: notes, error: true, errorMessage: 'An error occured'));
  }
}

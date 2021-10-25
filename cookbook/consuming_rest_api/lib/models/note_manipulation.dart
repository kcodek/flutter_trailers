import 'package:json_annotation/json_annotation.dart';

part 'note_manipulation.g.dart';

//used to create or update the  note

// @JsonSerializable(explicitToJson: true) // is needed when there are sub classes that need to be converted to JSON
@JsonSerializable()
class NoteManipulation {
  String noteTitle;
  String noteContent;

  NoteManipulation({
    required this.noteTitle,
    required this.noteContent,
  });

  Map<String, dynamic> toJson() => _$NoteManipulationToJson(
      this); // pass the 'this' - refers to the current object
}

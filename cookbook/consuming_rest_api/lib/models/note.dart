class Note {
  String? noteID;
  String? noteTitle;
  String? noteContent;
  DateTime createDateTime;
  DateTime latestEditDateTime;

  Note({
    this.noteID,
    this.noteTitle,
    this.noteContent,
    DateTime? createDateTime,
    DateTime? latestEditDateTime,
    //The default value of an optional parameter must be constant.
    // this.createDateTime = DateTime.now(),
    //
    // DateTime? latestEditDateTime,
  })  : createDateTime = createDateTime ?? DateTime.now(),
        latestEditDateTime = DateTime.now();
}

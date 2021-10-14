class NoteForListing {
  // for positional parameters
  String noteID;
  String noteTitle;
  DateTime createDateTime;
  DateTime latestEditDateTime;

  NoteForListing({
    required this.noteID,
    required this.noteTitle,
    DateTime? createDateTime,
    DateTime? latestEditDateTime,
    //The default value of an optional parameter must be constant.
    // this.createDateTime = DateTime.now(),
    //
    // DateTime? latestEditDateTime,
  })  : createDateTime = createDateTime ?? DateTime.now(),
        latestEditDateTime = DateTime.now();
}

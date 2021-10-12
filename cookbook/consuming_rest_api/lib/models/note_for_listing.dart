class NoteForListing {
  // for positional parameters
  String noteID;
  String noteTitle;
  DateTime createDateTime;
  DateTime latestEditDateTime;

  NoteForListing({
    this.noteID = "0",
    this.noteTitle = "Default title",
    //The default value of an optional parameter must be constant.
    // this.createDateTime = DateTime.now(),
    DateTime? createDateTime,
    DateTime? latestEditDateTime,
  })  : createDateTime = createDateTime ?? DateTime.now(),
        latestEditDateTime = DateTime.now();
}

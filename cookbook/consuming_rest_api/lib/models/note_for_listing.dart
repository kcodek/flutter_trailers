class NoteForListing {
  // for positional parameters
  String? noteID;
  String? noteTitle;
  DateTime createDateTime;
  DateTime latestEditDateTime;

  NoteForListing({
    this.noteID,
    this.noteTitle,
    // this.createDateTime,
    // this.latestEditDateTime
    DateTime? createDateTime,
    DateTime? latestEditDateTime,
    //The default value of an optional parameter must be constant.
    // this.createDateTime = DateTime.now(),
    //
    // DateTime? latestEditDateTime,
  })  : createDateTime = createDateTime ?? DateTime.now(),
        latestEditDateTime = DateTime.now();

  factory NoteForListing.fromJson(Map<String, dynamic> item) {
    return NoteForListing(
        noteID: item['noteID'],
        noteTitle: item['noteTitle'],
        createDateTime: DateTime.parse(item['createDateTime']),
        latestEditDateTime: item['latestEditDateTime'] != null
            ? DateTime.parse(item['latestEditDateTime'])
            : null);
  }
}

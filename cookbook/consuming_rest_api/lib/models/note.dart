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
        latestEditDateTime = latestEditDateTime ?? DateTime.now();

  factory Note.fromJson(Map<String, dynamic> item) {
    return Note(
        noteID: item['noteID'],
        noteTitle: item['noteTitle'],
        noteContent: item['noteContent'],
        createDateTime: DateTime.parse(item['createDatetime']),
        latestEditDateTime: item['latestEditDateTime'] != null
            ? DateTime.parse(item['latestEditDateTime'])
            : DateTime.parse(item['createDatetime']));
  }
}

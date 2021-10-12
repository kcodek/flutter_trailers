import 'package:flutter/material.dart';

class NoteModify extends StatelessWidget {
  const NoteModify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create note')),
      body: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: 'Note title'),
              ),
              Container(
                height: 16,
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Note content'),
              ),
              Container(
                height: 32,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Submit'),
                ),
              )
            ],
          )),
    );
  }
}

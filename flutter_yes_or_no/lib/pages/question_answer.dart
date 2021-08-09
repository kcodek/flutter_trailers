import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class QuestionAnswerPage extends StatefulWidget {
  @override
  _QuestionAnswerPageState createState() => _QuestionAnswerPageState();
}

class _QuestionAnswerPageState extends State<QuestionAnswerPage> {
  /// Text editing controller for question text field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('I Know Everything'),
        elevation: 0,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 0.6 * MediaQuery.of(context).size.width,
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Ask a Question', border: OutlineInputBorder()),
              )),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                  // primary: Colors.deepPurpleAccent,
                  shape: StadiumBorder(),
                ),
                child: Text(
                  'Get Answer',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                  // primary: Colors.deepPurpleAccent,
                  shape: StadiumBorder(),
                ),
                child: Text('Reset', style: TextStyle(color: Colors.white)),
              )
            ],
          )
        ],
      ),
    );
  }
}

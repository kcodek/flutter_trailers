import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_yes_or_no/models/answer.dart';

import 'package:http/http.dart' as http;

class QuestionAnswerPage extends StatefulWidget {
  @override
  _QuestionAnswerPageState createState() => _QuestionAnswerPageState();
}

class _QuestionAnswerPageState extends State<QuestionAnswerPage> {
  /// Text editing controller for question text field
  TextEditingController _questionFieldController = TextEditingController();

  /// To store the current answer object
  Answer _currentAnswer;

  /// Handle the process of getting a yes/no answer
  _handleGetAnswer() async {
    try {
      var url = Uri.https('yesno.wtf', '/api');
      http.Response response = await http.get(url);
      // http.Response response = await http.get('https://yesno.wtf/api');
      // print(response.body);
      if (response.statusCode == 200 && response.body != null) {
        Map<String, dynamic> responsebody = json.decode(response.body);
        Answer answer = Answer.fromMap(responsebody);
        setState(() {
          _currentAnswer = answer;
        });
      }
    } catch (err, stacktrace) {
      print(err);
      print(stacktrace);
    }
  }

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
          if (_currentAnswer != null)
            Container(
              height: 250,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  fit:BoxFit.cover,
                  image: NetworkImage(_currentAnswer.image),
                )
                ),
            )
          if (_currentAnswer != null)
            SizedBox(
              height: 20,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _handleGetAnswer,
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

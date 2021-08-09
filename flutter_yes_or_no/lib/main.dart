import 'package:flutter/material.dart';
import 'package:flutter_yes_or_no/pages/question_answer.dart';

void main() {
  runApp(IKnowEverythingApp());
}

class IKnowEverythingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'I know Everything',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: QuestionAnswerPage(),
    );
  }
}

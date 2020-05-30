import 'package:biologyquiz/model/chapter.dart';
import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget {
  final Chapter chapter;

  QuestionsScreen({this.chapter});

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.purple,
                Colors.blue,
              ]),
        ),
      ),
    );
  }
}

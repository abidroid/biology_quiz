import 'package:biologyquiz/model/question.dart';
import 'package:flutter/material.dart';

class CorrectAnswersScreen extends StatefulWidget {
  final List<Question> questions;
  final String name;

  CorrectAnswersScreen({this.questions, this.name});

  @override
  _CorrectAnswersScreenState createState() => _CorrectAnswersScreenState();
}

class _CorrectAnswersScreenState extends State<CorrectAnswersScreen> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.purple,
              Colors.blue,
            ]),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
              SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: Text(
                  '${widget.name}',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                      color: Colors.white.withOpacity(0.9)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: widget.questions.length,
                itemBuilder: (BuildContext context, int index) {
                  Question question = widget.questions[index];
                  return ExpansionTile(
                    onExpansionChanged: (value) {
                      setState(() {
                        expanded = value;
                      });
                    },
                    trailing: Icon(
                      expanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      color: Colors.white70,
                    ),
                    title: Text(
                      question.q,
                      style: TextStyle(color: Colors.white70),
                    ),
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.all(16.0),
                          child: Text(
                            'Ans: ${question.ans}',
                            style: TextStyle(color: Colors.white70),
                          )),
                      Visibility(
                        visible: (question.img == 'na') ? false : true,
                        child: Image.network(question.img),
                      )
                    ],
                  );
                }),
          )
        ],
      ),
    ));
  }
}

import 'package:biologyquiz/model/question.dart';
import 'package:biologyquiz/screens/correct_anwers_screen.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final String name;
  final int tSeconds;
  final int totalCorrect;
  final int totalWrong;
  final List<Question> questions;

  ResultScreen({this.name, this.tSeconds, this.totalCorrect, this.totalWrong, this.questions});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
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
            color: Colors.green),
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
                  ),
                )
              ],
            ),


            SizedBox(
              height: 16,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 150, child: Text('Seconds/Question', style: TextStyle(color: Colors.white),)),
                  Text('${widget.tSeconds} sec', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 100, child: Text('Total Questions', style: TextStyle(color: Colors.white))),
                  Container(
                    width: 150,
                    height: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.blue),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text('${widget.questions.length}', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 100, child: Text('Correct', style: TextStyle(color: Colors.white))),
                  Stack(
                    children: <Widget>[
                      Container(
                        width: 150,
                        height: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.grey[300]),
                      ),
                      Container(
                        width: 150 * widget.totalCorrect / widget.questions.length,
                        height: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.green),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(widget.totalCorrect.toString(), style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 100, child: Text('Wrong', style: TextStyle(color: Colors.white))),
                  Stack(
                    children: <Widget>[
                      Container(
                        width: 150,
                        height: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.grey[300]),
                      ),
                      Container(
                        width: 150 * widget.totalWrong / widget.questions.length,
                        height: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.red),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(widget.totalWrong.toString(), style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 100, child: Text('Left', style: TextStyle(color: Colors.white))),
                  Stack(
                    children: <Widget>[
                      Container(
                        width: 150,
                        height: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.grey[300]),
                      ),
                      Container(
                        width: 150 *
                            (widget.questions.length - (widget.totalCorrect + widget.totalWrong)) /
                            widget.questions.length,
                        height: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.deepOrange),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text('${widget.questions.length - (widget.totalCorrect + widget.totalWrong)}', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(16.0),
              child: RaisedButton(
                child: Text('View Correct Answers'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                onPressed: () {
                  //_showAd();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context){
                     return CorrectAnswersScreen(questions: widget.questions, name: widget.name,);
                    }
                  ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

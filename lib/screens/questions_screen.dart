import 'dart:async';

import 'package:biologyquiz/model/chapter.dart';
import 'package:biologyquiz/model/question.dart';
import 'package:biologyquiz/screens/result_screen.dart';
import 'package:biologyquiz/util/util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class QuestionsScreen extends StatefulWidget {
  final Chapter chapter;
  final double tQuestions;
  final double tSeconds;

  QuestionsScreen({this.chapter, this.tQuestions, this.tSeconds});

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  Firestore _firestore = Firestore.instance;
  StreamController _streamController;
  Stream _stream;

  getQuestions() async {
    _streamController.add('loading');

    if (await Util.isInternetAvailable() == false) {
      _streamController.add('no_internet');
      return;
    }

    // get all documents from the collection
    QuerySnapshot snapshot =
        await _firestore.collection(widget.chapter.code).getDocuments();

    List<DocumentSnapshot> questionsDocs = snapshot.documents;

    // shuffle the documents
    questionsDocs.shuffle();
    //print(questionsDocs.length);

    List<Question> questions = [];

    // get the total questions according to user settings
    for (int i = 0; i < widget.tQuestions.toInt(); i++) {
      Question question = Question.fromJSON(questionsDocs[i].data);
      questions.add(question);
      //print('${i + 1}: ${question.q}');
    }

    _streamController.add(questions);
  }

  @override
  void initState() {
    super.initState();

    _streamController = StreamController();
    _stream = _streamController.stream;

    getQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
                        // Navigator.of(context).pop();
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
                      '${widget.chapter.name}',
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
                height: 8.0,
              ),
              Expanded(
                child: StreamBuilder(
                  stream: _stream,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data == 'no_internet') {
                        return Center(
                          child: Text('No Internet'),
                        );
                      } else if (snapshot.data == 'loading') {
                        return Center(
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SpinKitCircle(
                                  color: Colors.pink,
                                  size: 50,
                                ),
                                Text('Loading Quiz'),
                              ],
                            ),
                          ),
                        );
                      } else {
                        List<Question> questions = snapshot.data;

                        return QuizWidget(
                          questions: questions,
                          totalSeconds: widget.tSeconds.toInt(),
                          chapter: widget.chapter,
                        );
                      }
                    } else {
                      return Center(
                        child: Text('Something went wrong'),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// creates the whole UI after questions are fetched from firestore
class QuizWidget extends StatefulWidget {
  final List<Question> questions;
  final int totalSeconds;
  final Chapter chapter;

  QuizWidget({this.questions, this.totalSeconds, this.chapter});

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int currentQuestionIndex;
  int totalCorrect;
  int totalWrong;

  Timer _timer;
  int _currentSecond;

  void startTimer() {
    //_currentSecond = widget.totalSeconds;

    if (_timer != null) {
      _timer.cancel();
      _currentSecond = widget.totalSeconds.toInt();
    }

    const oneSec = const Duration(seconds: 1);

    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_currentSecond < 1) {
            timer.cancel();
            goToNextQuestion();
          } else {
            _currentSecond = _currentSecond - 1;
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    currentQuestionIndex = 0;
    totalWrong = 0;
    totalCorrect = 0;
    _currentSecond = widget.totalSeconds.toInt();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Time $_currentSecond',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  '${currentQuestionIndex + 1} of ${widget.questions.length}',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            padding: EdgeInsets.all(10.0),
            height: 100,
            decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.black54
                    : Colors.grey[200]),
            alignment: Alignment.center,
            child: Text(
              widget.questions[currentQuestionIndex].q,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  RaisedButton(
                    child: Text(
                      widget.questions[currentQuestionIndex].a,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    onPressed: () {
                      check(widget.questions[currentQuestionIndex].a);
                    },
                  ),
                  RaisedButton(
                    child: Text(
                      widget.questions[currentQuestionIndex].b,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    onPressed: () {
                      check(widget.questions[currentQuestionIndex].b);
                    },
                  ),
                  RaisedButton(
                    child: Text(widget.questions[currentQuestionIndex].c),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    onPressed: () {
                      check(widget.questions[currentQuestionIndex].c);
                    },
                  ),
                  RaisedButton(
                    child: Text(
                      widget.questions[currentQuestionIndex].d,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    onPressed: () {
                      check(widget.questions[currentQuestionIndex].d);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void check(String text) {
    if (text == widget.questions[currentQuestionIndex].ans) {
      print('correct');
      totalCorrect++;
    } else {
      print('wrong');
      totalWrong++;
    }

    goToNextQuestion();
  }

  void goToNextQuestion() {
    if (currentQuestionIndex == widget.questions.length - 1) {
      //print('Can\'t go forward');
      //print('Total Correct $totalCorrect\nTotal Wrong $totalWrong');
      print('result screen coming soon');

      _timer.cancel();
      showResult();
    } else {
      currentQuestionIndex++;
      startTimer();
      setState(() {});
    }
  }

  void showResult() {
    // _countdownTimer.cancel();

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return ResultScreen(
          name: widget.chapter.name,
          tSeconds: widget.totalSeconds,
          totalCorrect: totalCorrect,
          totalWrong: totalWrong,
          questions: widget.questions);
    }));
  }
}

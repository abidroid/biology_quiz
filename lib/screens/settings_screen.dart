import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double totalQuestions = 20;
  double totalSeconds = 20;
  SharedPreferences prefs;

  @override
  void initState() {
    getInitialStoredValues();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.purple,
              Colors.blue,
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                Text(
                  'Settings',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                      color: Colors.white.withOpacity(0.9)),
                )
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(children: <Widget>[
                    Text(
                      'Total Questions per Quiz: ',
                      style: TextStyle(color: Colors.white),
                    ),

                    Text(
                      '${totalQuestions.toStringAsFixed(0)}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ]),
                  SizedBox(
                    height: 8,
                  ),
                  Slider(
                    max: 30,
                    min: 10,
                    divisions: 4,
                    value: totalQuestions,
                    activeColor: Colors.green,
                    label: totalQuestions.toStringAsFixed(0),
                    onChanged: (value) {
                      updateTotalQuestions(value);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(children: <Widget>[
                    Text(
                      'Total Seconds per Question: ',
                      style: TextStyle(color: Colors.white),
                    ),

                    Text(
                      '${totalSeconds.toStringAsFixed(0)}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ]),
                  SizedBox(
                    height: 8,
                  ),
                  Slider(
                    max: 30,
                    min: 10,
                    divisions: 4,
                    value: totalSeconds,
                    activeColor: Colors.green,
                    label: totalSeconds.toStringAsFixed(0),
                    onChanged: (value) {
                      updateTotalSeconds(value);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  getInitialStoredValues() async {
    prefs = await SharedPreferences.getInstance();
    totalQuestions = prefs.getDouble('t_questions') ?? 20.0;
    totalSeconds = prefs.getDouble('t_seconds') ?? 20.0;

    setState(() {});

    print(totalQuestions);
    print(totalSeconds);
  }

  updateTotalQuestions(double value) async {
    await prefs.setDouble('t_questions', value);

    setState(() {
      totalQuestions = value;
    });
  }

  updateTotalSeconds(double value) async {
    await prefs.setDouble('t_seconds', value);

    setState(() {
      totalSeconds = value;
    });
  }
}

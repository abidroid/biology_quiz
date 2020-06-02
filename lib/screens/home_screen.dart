import 'package:biologyquiz/model/chapter.dart';
import 'package:biologyquiz/screens/questions_screen.dart';
import 'package:biologyquiz/screens/settings_screen.dart';
import 'package:biologyquiz/util/data_store.dart';
import 'package:biologyquiz/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            color: Colors.green),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Biology\nQuiz',
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                        color: Colors.white.withOpacity(0.9)),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.white.withOpacity(0.9),
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return SettingsScreen();
                      }));
                    },
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                //color: Colors.green,
                child: Swiper(
                  itemCount: DataStore.allChapters().length,
                  itemBuilder: (BuildContext context, int index) {
                    return ChapterCard(DataStore.allChapters()[index]);
                  },
                  itemWidth: 250,
                  layout: SwiperLayout.STACK,
                  pagination: SwiperPagination(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChapterCard extends StatelessWidget {
  final Chapter chapter;

  ChapterCard(this.chapter);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.topCenter,
        width: 250.0,
        height: 550,
        //color: Colors.pink,

        child: Stack(
          children: <Widget>[
            Container(
              width: 250.0,
              height: 550.0,
              //color: Colors.grey,
            ),
            Positioned(
              top: 75,
              width: 250,
              height: 350,
              child: Container(
                padding: EdgeInsets.only(top: 100),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(color: Colors.grey[300]),
                    color: Colors.white),
                child: Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 16.0),
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              '${chapter.name}',
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black.withOpacity(0.7)),
                            )),
                        SizedBox(
                          height: 8.0,
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              '${chapter.desc}',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7)),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                            )),
                        Spacer(),
                        InkWell(
                          onTap: () async {
                            if (await Util.isInternetAvailable() == false) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext ctx) {
                                    return AlertDialog(
                                      title: Text(
                                          'You are offline\nPlease connect and retry'),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text('OK'),
                                          onPressed: () {
                                            Navigator.of(ctx).pop();
                                          },
                                        )
                                      ],
                                    );
                                  });

                              return;
                            }

                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            double totalQuestions =
                                prefs.getDouble('t_questions') ?? 20.0;
                            double totalSeconds =
                                prefs.getDouble('t_seconds') ?? 20.0;

                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return QuestionsScreen(
                                  chapter: chapter,
                                  tQuestions: totalQuestions,
                                  tSeconds: totalSeconds);
                            }));
                          },
                          child: Container(
                            alignment: Alignment.bottomRight,
                            margin: EdgeInsets.only(bottom: 16.0, right: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'Start Quiz',
                                  style: TextStyle(color: Colors.green),
                                ),
                                Icon(
                                  Icons.arrow_right,
                                  color: Colors.green,
                                ),
                              ],
                            ),
                          ),
                        )
                      ]),
                ),
              ),
            ),
            Positioned(
              left: 35,
              child: Container(
                alignment: Alignment.center,
                width: 180.0,
                height: 180.0,
                child: Image.asset(chapter.img),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

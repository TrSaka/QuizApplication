// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unnecessary_string_interpolations, non_constant_identifier_names, unused_local_variable, use_key_in_widget_constructors, file_names
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Const/colors.dart';
import 'package:flutter_application_1/model/question_model.dart';
import 'package:flutter_application_1/screens/Quiz_Screen.dart';
import 'package:flutter_application_1/screens/Welcome_Screen.dart';
import 'package:flutter_application_1/screens/score_board.dart';
import 'package:flutter_application_1/screens/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

String no2 = "0";
String no3 = "0";
String no4 = "0";
String no5 = "0";
int selected_index = 1;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ],
  );
}

class App2Page extends StatefulWidget {
  @override
  _App2State createState() => _App2State();
}

class _App2State extends State<App2Page> {
  SharedPreferences preferences;
  int counter = 0;

  Future<void> showData() async {
    var saver = await SharedPreferences.getInstance();
    List score_check = [0, 0, 0, 0, 0];

    String score2 = saver.getString("my_score1").toString();

    score_check = json.decode(score2);

    score_check.sort();
    score_check = List.from(score_check.reversed);
    no1 = score_check[0].toString();
    no2 = score_check[1].toString();
    no3 = score_check[2].toString();
    no4 = score_check[3].toString();
    no5 = score_check[4].toString();
    debugPrint("showData" + score_check.toString());
  }

  void onItemTapped(int index) {
    setState(() {
      selected_index = index;
    });
  }

  final screens = [
    Setting_Page(),
    MyHomePage(),
    ScoreBoard(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple.shade400,
              Colors.deepPurple.shade400,
              Colors.pink.shade300,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 120,
                ),
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    "$title",
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 49,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                    speed: Duration(milliseconds: 125),
                  ),
                ],
                totalRepeatCount: 1,
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
              Text(
                "$alt_title",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 230),
              ),
              MaterialButton(
                padding: EdgeInsets.symmetric(horizontal: 120),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(48),
                ),
                height: 40,
                color: Colors.deepPurple.shade400,
                textColor: Colors.white,
                child: Text(
                  "$but_title",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    height: 2,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (c, a1, a2) => MyHomePage(),
                      transitionsBuilder: (c, anim, a2, child) =>
                          FadeTransition(opacity: anim, child: child),
                      transitionDuration: Duration(milliseconds: 600),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

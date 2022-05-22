// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, unused_import, unnecessary_string_interpolations, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Const/colors.dart';
import 'package:flutter_application_1/data/question_list.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/model/question_model.dart';
import 'package:flutter_application_1/screens/Quiz_Screen.dart';
import 'package:flutter_application_1/screens/Welcome_Screen.dart';
import 'package:flutter_application_1/screens/score_board.dart';
import 'package:flutter_application_1/screens/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultScreen extends StatefulWidget {
  int score;
  int counter;
  ResultScreen(this.score, {Key key}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Future<void> saveData() async {
    final saver = await SharedPreferences.getInstance();
    saver.setString("my_score1", scores.toString());
  }

  Future<void> getNo() async {
    var saver = await SharedPreferences.getInstance();
    saver.setInt("true", true_no);
    saver.setInt("false", false_no);
    saver.setInt("pass", pass_no);
  }

  @override
  Widget build(BuildContext context) {
    saveData();
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.fromLTRB(0, 200, 0, 0)),
              Text(
                "$over_text",
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "$over_score",
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                  fontSize: 38,
                ),
              ),
              SizedBox(
                height: 90,
              ),
              Text(
                "${widget.score}",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 60,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (c, a1, a2) => App(),
                      transitionsBuilder: (c, anim, a2, child) =>
                          FadeTransition(opacity: anim, child: child),
                      transitionDuration: Duration(milliseconds: 600),
                    ),
                  );
                  scores.add(widget.score);
                  saveData();
                  getNo();
                  debugPrint("$scores");
                  setState(() {});
                },
                textColor: Colors.white,
                color: Colors.purple.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "$over_but_title",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

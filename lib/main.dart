// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unnecessary_string_interpolations, non_constant_identifier_names, prefer_const_constructors_in_immutables, unused_local_variable, missing_return, unused_import

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Const/colors.dart';
import 'package:flutter_application_1/model/languages.dart';
import 'package:flutter_application_1/model/question_model.dart';
import 'package:flutter_application_1/screens/Load.dart';
import 'package:flutter_application_1/screens/Welcome_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

void main() => runApp(App1());

class App1 extends StatelessWidget {
  const App1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Language(),
    );
  }
}

class Language extends StatefulWidget {
  Language({Key key}) : super(key: key);

  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
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

  Future<void> saveData() async {
    final saver = await SharedPreferences.getInstance();
    saver.setString("my_score1", scores.toString());
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFCF5CCF),
                Color(0xFFFF57AC),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width / 5),
                ),
                Text(
                  "Quizz Game",
                  style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                Text(
                  "Select a language for start",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Text(
                  "- Language -",
                  style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                MaterialButton(
                  padding: EdgeInsets.symmetric(horizontal: 120),
                  onPressed: () {
                    Turkish();

                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) => LoadingScreen(),
                        transitionsBuilder: (c, anim, a2, child) =>
                            FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 600),
                      ),
                    );
                  },
                  color: Colors.pinkAccent.shade200,
                  minWidth: 300.0,
                  height: 43,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "Türkçe",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
                MaterialButton(
                  padding: EdgeInsets.symmetric(horizontal: 120),
                  onPressed: () {
                    English();
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) => LoadingScreen(),
                        transitionsBuilder: (c, anim, a2, child) =>
                            FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 600),
                      ),
                    );
                  },
                  color: Colors.pinkAccent.shade200,
                  minWidth: 300.0,
                  height: 43,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "English",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 17.0,
                ),
                MaterialButton(
                  padding: EdgeInsets.symmetric(horizontal: 115),
                  onPressed: () {
                    German();
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (c, a1, a2) => LoadingScreen(),
                        transitionsBuilder: (c, anim, a2, child) =>
                            FadeTransition(opacity: anim, child: child),
                        transitionDuration: Duration(milliseconds: 600),
                      ),
                    );
                  },
                  height: 43,
                  color: Colors.pinkAccent.shade200,
                  minWidth: 300.0,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "Deutsch",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 4),
                  child: Text(
                    "| Designed by Saka | ",
                    style: TextStyle(color: optionColor),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, unused_import, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, non_constant_identifier_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Const/colors.dart';
import 'package:flutter_application_1/model/question_model.dart';
import 'package:flutter_application_1/screens/Quiz_Screen.dart';
import 'package:flutter_application_1/screens/Welcome_Screen.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScoreBoard extends StatefulWidget {
  const ScoreBoard({Key key}) : super(key: key);

  @override
  State<ScoreBoard> createState() => _ScoreBoardState();
}

String score2 = "";
List score_check = [0, 0, 0, 0, 0];
String last_value = "0";

class _ScoreBoardState extends State<ScoreBoard> {
  Future<void> saveData() async {
    final saver = await SharedPreferences.getInstance();
    saver.setString("my_score1", scores.toString());
  }

  Future<void> showData() async {
    var saver = await SharedPreferences.getInstance();
    score2 = saver.getString("my_score1").toString();
    score_check = json.decode(score2);
    score_check.sort();
    score_check = List.from(score_check.reversed);

    setState(() {
      no1 = score_check[0].toString();
      no2 = score_check[1].toString();
      no3 = score_check[2].toString();
      no4 = score_check[3].toString();
      no5 = score_check[4].toString();
    });
    debugPrint("showData" + score_check.toString());
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => showData());
    setState(() {
      no1;
      no2;
      no3;
      no4;
      no5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade400,
        centerTitle: true,
        title: Text("Score Board"),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Share.share(""" 
    - My Scores -
1️⃣ - $no1
2️⃣ - $no2
3️⃣ - $no3 
4️⃣ - $no4 
5️⃣ - $no5
Try to pass me 💪🏼             
              """);
            },
            icon: Icon(Icons.share),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
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
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(40, 120, 2, 2),
                    ),
                    Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.yellow.shade700,
                          width: 5,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "1",
                          style: TextStyle(
                            color: Colors.yellow.shade600,
                            fontSize: 72,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(40, 0, 2, 2),
                    ),
                    Text(
                      "$no1",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 60,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(40, 120, 2, 2),
                    ),
                    Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue.shade50,
                          width: 5,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "2",
                          style: TextStyle(
                            color: Colors.blue.shade50,
                            fontSize: 72,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(40, 0, 2, 2),
                    ),
                    Text(
                      "$no2",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 60,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(40, 120, 2, 2),
                    ),
                    Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.brown.shade300,
                          width: 5,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "3",
                          style: TextStyle(
                            color: Colors.brown.shade300,
                            fontSize: 72,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(40, 40, 2, 2),
                    ),
                    Text(
                      "$no3",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 60,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(40, 120, 2, 2),
                    ),
                    Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple.shade100,
                          width: 5,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "4",
                          style: TextStyle(
                            color: Colors.purple.shade100,
                            fontSize: 72,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(40, 0, 2, 2),
                    ),
                    Text(
                      "$no4",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 60,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(40, 120, 2, 2),
                    ),
                    Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.green.shade100,
                          width: 5,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "5",
                          style: TextStyle(
                            color: Colors.green.shade100,
                            fontSize: 72,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(40, 0, 2, 2),
                    ),
                    Text(
                      "$no5",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 60,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

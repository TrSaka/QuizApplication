// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unnecessary_string_interpolations, non_constant_identifier_names, unused_local_variable, use_key_in_widget_constructors, file_names, unused_import
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Const/colors.dart';
import 'package:flutter_application_1/screens/Statics.dart';
import 'package:flutter_application_1/screens/Welcome.dart';
import 'package:flutter_application_1/screens/score_board.dart';
import 'package:flutter_application_1/screens/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppPage(),
    );
  }
}

String no1 = "0";
String no2 = "0";
String no3 = "0";
String no4 = "0";
String no5 = "0";
int selected_index = 1;

class AppPage extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<AppPage> {
  SharedPreferences preferences;

  Future<void> showData() async {
    var saver = await SharedPreferences.getInstance();
    List score_check = [0, 0, 0, 0, 0];
    String check_name = saver.getString("name1").toString();

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
    StaticPage(),
    App2Page(),
    ScoreBoard(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        iconSize: 25,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.query_stats_rounded),
            label: '',
            backgroundColor: Colors.purple.shade400,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: '',
            backgroundColor: Colors.pink.shade400,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: '',
            backgroundColor: Colors.purple.shade400,
          ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.blue,
        currentIndex: selected_index,
        onTap: (index) => setState(() => selected_index = index),
      ),
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
          child: screens[selected_index],
        ),
      ),
    );
  }
}

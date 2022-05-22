// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unnecessary_new, use_key_in_widget_constructors, unnecessary_brace_in_string_interps, unnecessary_this, unused_local_variable, unnecessary_string_interpolations, file_names, unused_import
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/question_model.dart';
import 'package:flutter_application_1/screens/Welcome_Screen.dart';
import 'package:flutter_application_1/screens/score_board.dart';
import 'dart:math';
import 'dart:async';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_application_1/screens/Welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StaticApp extends StatelessWidget {
  const StaticApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '$text36',
      theme: ThemeData(),
      home: StaticPage(),
    );
  }
}

Random rnd = new Random();
int min = 10;
int max = 1000;
int userNumber = min + rnd.nextInt(max - min);
int total_hour = 0;
int real_counter;
int trues_value;
int false_value;
int pass_value;

class StaticPage extends StatefulWidget {
  @override
  State<StaticPage> createState() => _StaticPageState();
}

class _StaticPageState extends State<StaticPage> {
  String total_hour2 = "";
  TextEditingController controller;
  String user_name = " ";

  Future<void> saveData1() async {
    final saver = await SharedPreferences.getInstance();
    saver.setString("name1", user_name.toString());
  }

  Future<void> showData1() async {
    var saver = await SharedPreferences.getInstance();
    debugPrint("show data1 runned");
    user_name = saver.getString("name1").toString();
    debugPrint("showData" + score_check.toString());
    setState(() {
      no1;
      real_counter;
    });
  }

  Future<void> showNo() async {
    var saver = await SharedPreferences.getInstance();
    trues_value = saver.getInt("true");
    false_value = saver.getInt("false");
    pass_value = saver.getInt("pass");
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => showData1());
    WidgetsBinding.instance.addPostFrameCallback((_) => showNo());
    setState(() {
      no1;
      user_name;
      trues_value;
      false_value;
      pass_value;
    });

    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple.shade400,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Statics",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Share.share("""       - Quizz App Statics -
                
    Name : $user_name  No : $userNumber
--------------------------------------------
  Best Score = $no1     Last Score = $no1

  Correct = $trues_value  Wrong = $false_value   Passed = $pass_value

  

""", subject: "$user_name");
              },
              icon: Icon(
                Icons.share,
              ),
            ),
          ],
        ),
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
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/appimages/profile_photo.png"),
                      fit: BoxFit.contain,
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.deepPurple,
                        Colors.red,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 30),
                    ),
                    Text(
                      "$user_name",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    IconButton(
                      padding: EdgeInsets.only(bottom: 10),
                      onPressed: () async {
                        String name = await openDialog();
                        if (name == null || name.isEmpty) return;
                        setState(() => this.user_name = name);
                      },
                      icon: Icon(Icons.edit),
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "$text37 : $userNumber",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Colors.white,
                  height: 2,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 83),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 11.0),
                          child: Padding(
                            padding: EdgeInsets.only(left: 7),
                            child: Text(
                              "$text38 : $no1",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 29,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    "$text40 : ${trues_value.toString()} ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 29,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    "$text41 : ${false_value.toString()}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 29,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    "$text42 : ${pass_value.toString()}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 29,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String> openDialog() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("İsminiz"),
          content: TextField(
            autofocus: true,
            decoration: InputDecoration(
              hintText: "İsminizi giriniz.",
              iconColor: Colors.purple,
              fillColor: Colors.pink,
            ),
            controller: controller,
          ),
          actions: [
            TextButton(
              onPressed: accept_Name,
              child: Text("Tamam"),
            ),
          ],
        ),
      );

  void accept_Name() {
    Navigator.of(context, rootNavigator: true).pop(controller.text);
    saveData1();
    controller.clear();
    setState(() {});
  }
}

// ignore_for_file: prefer_const_constructors, camel_case_types, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Const/colors.dart';
import 'package:flutter_application_1/model/question_model.dart';
import 'package:flutter_application_1/screens/Welcome_Screen.dart';

class Setting extends StatelessWidget {
  const Setting({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: Setting_Page(),
    );
  }
}

class Setting_Page extends StatefulWidget {
  const Setting_Page({Key key}) : super(key: key);

  @override
  _Setting_PageState createState() => _Setting_PageState();
}

class _Setting_PageState extends State<Setting_Page> {
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
                padding: EdgeInsets.only(top: 110),
              ),
              Text(
                "$text31",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                "$text32",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextButton(
                child: Text(
                  "$text34",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () {
                  mainColor = Colors.blueGrey.shade100;
                  titleColor = Colors.black;
                  questColor = Colors.black;
                  optionColor = Colors.black87;
                  iconColor = Colors.blue;
                  bigtext = Colors.blue;
                  minAppBtn = Colors.orange;
                  setState(() {});
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (c, a1, a2) => AppPage(),
                      transitionsBuilder: (c, anim, a2, child) =>
                          FadeTransition(opacity: anim, child: child),
                      transitionDuration: Duration(milliseconds: 600),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 5,
              ),
              TextButton(
                child: Text(
                  "$text33",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onPressed: () {
                  mainColor = Color(0xFF252c4a);
                  titleColor = Colors.white;
                  questColor = Colors.white;
                  optionColor = Colors.white;
                  iconColor = Colors.white;
                  bigtext = Colors.orange;
                  minAppBtn = Colors.orange;
                  setState(() {});
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (c, a1, a2) => AppPage(),
                      transitionsBuilder: (c, anim, a2, child) =>
                          FadeTransition(opacity: anim, child: child),
                      transitionDuration: Duration(milliseconds: 600),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(height: 305),
              Text(
                "$text0",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

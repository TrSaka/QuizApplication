// ignore_for_file: unused_import, prefer_const_constructors, avoid_print, unnecessary_string_interpolations, prefer_final_fields, non_constant_identifier_names, file_names

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Const/colors.dart';
import 'package:flutter_application_1/data/question_list.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/model/question_model.dart';
import 'package:flutter_application_1/screens/Statics.dart';
import 'package:flutter_application_1/screens/Welcome_Screen.dart';
import 'package:flutter_application_1/screens/score.dart';
import 'package:flutter_application_1/screens/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

int true_no = 0;
int false_no = 0;
int pass_no = 0;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _controller = PageController(initialPage: 0);
  bool isPressed = false;
  int score = 0;
  int last_pass = 3;
  int counter = 0;
  @override
  void initState() {
    super.initState();
    trues_value = 0;
    false_value = 0;
    pass_value = 0;
    true_no = 0;
    false_no = 0;
    pass_no = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        shadowColor: Colors.pink,
        backgroundColor: Colors.purple.shade400,
        elevation: 0,
        leading: IconButton(
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
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: iconColor,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 1),
        child: PageView.builder(
          controller: _controller,
          onPageChanged: (page) {
            setState(
              () {
                isPressed = false;
              },
            );
          },
          physics: NeverScrollableScrollPhysics(),
          itemCount: 30,
          itemBuilder: (context, index) {
            return Container(
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
                    Padding(padding: EdgeInsets.only(top: 0)),
                    SizedBox(
                      height: 80,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            " $quest_title  ${index + 1} / ${questions.length}",
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.normal,
                            ),
                            speed: Duration(milliseconds: 80),
                          ),
                        ],
                        totalRepeatCount: 1,
                        displayFullTextOnTap: true,
                        stopPauseOnTap: true,
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                      height: 2,
                      thickness: 2,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          "${questions[index].question}",
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 28.0,
                            fontWeight: FontWeight.normal,
                          ),
                          speed: Duration(milliseconds: 50),
                        ),
                      ],
                      totalRepeatCount: 1,
                      displayFullTextOnTap: true,
                      stopPauseOnTap: true,
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    for (int i = 0; i < questions[index].answers.length; i++)
                      Container(
                        width: 375,
                        margin: EdgeInsets.only(bottom: 36),
                        child: MaterialButton(
                          color: isPressed
                              ? questions[index]
                                      .answers
                                      .entries
                                      .toList()[i]
                                      .value
                                  ? trueColor
                                  : wrongColor
                              : secondColor,
                          padding: EdgeInsets.symmetric(vertical: 24),
                          onPressed: isPressed
                              ? () {}
                              : () {
                                  setState(
                                    () {
                                      isPressed = true;
                                      true_no;
                                      false_no;
                                    },
                                  );
                                  if (questions[index]
                                      .answers
                                      .entries
                                      .toList()[i]
                                      .value) {
                                    score = score + 10;
                                    print(score);
                                    true_no = true_no + 1;
                                    debugPrint("true no = $true_no");
                                  } else {
                                    false_no = false_no + 1;
                                    debugPrint("false no = $false_no");
                                  }
                                },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Text(
                            questions[index].answers.keys.toList()[i],
                            style: TextStyle(
                              color: questColor,
                            ),
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                OutlinedButton(
                                  onPressed: () {
                                    if (index + 1 == questions.length) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ResultScreen(score),
                                        ),
                                      );
                                    }
                                    if (last_pass > 0) {
                                      _controller.nextPage(
                                          duration: Duration(milliseconds: 225),
                                          curve: Curves.linear);
                                      pass_no = pass_no + 1;
                                      debugPrint("pass no = $pass_no");
                                      setState(
                                        () {
                                          last_pass = last_pass - 1;
                                          pass_no;
                                        },
                                      );
                                    }
                                  },
                                  style: ButtonStyle(),
                                  child: Text(
                                    "$quiz_but $last_pass",
                                    style: TextStyle(
                                      color: optionColor,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                //---------------------
                                OutlinedButton(
                                  onPressed: isPressed
                                      ? index + 1 == questions.length
                                          ? () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ResultScreen(score)));
                                              true_no = true_no;
                                              debugPrint(true_no.toString());
                                            }
                                          : () {
                                              _controller.nextPage(
                                                  duration: Duration(
                                                      milliseconds: 200),
                                                  curve: Curves.linear);
                                            }
                                      : null,
                                  style: ButtonStyle(),
                                  child: Text(
                                    index + 1 == questions.length
                                        ? "$last_but_changeable"
                                        : "$quiz_forward",
                                    style: TextStyle(
                                      color: optionColor,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

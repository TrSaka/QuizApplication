//https://assets6.lottiefiles.com/packages/lf20_0fvcgy9k.json

// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/question_model.dart';
import 'package:flutter_application_1/screens/Welcome_Screen.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 45),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          text43,
                          textStyle: const TextStyle(
                            fontSize: 40.0,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                          speed: const Duration(milliseconds: 100),
                        ),
                      ],
                      totalRepeatCount: 2,
                      pause: const Duration(milliseconds: 200),
                      displayFullTextOnTap: true,
                      stopPauseOnTap: true,
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      Container(
                        width: 600,
                        height: 450,
                        child: Center(
                          child: Lottie.asset(
                            "assets/jsons/bored_hand.json",
                            repeat: true,
                            reverse: false,
                            animate: true,
                          ),
                        ),
                      ),
                      Container(
                        width: 400,
                        height: 100,
                        child: Center(
                          child: Lottie.asset(
                            "assets/jsons/loads_white.json",
                            repeat: true,
                            reverse: false,
                            animate: true,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                FutureBuilder(
                  future: Future.delayed(
                    const Duration(seconds: 2),
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => App()),
                      );
                    },
                  ),
                  builder:
                      (BuildContext context, AsyncSnapshot<Null> snapshot) {
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

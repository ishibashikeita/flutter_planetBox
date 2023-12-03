import 'dart:async';

import 'package:flutter/material.dart';
import 'package:planetbox/api/fetchCountry.dart';
import 'package:planetbox/const/starconst.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'apipractice.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'choose.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool disabled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: disabled
                ? () async {
                    if (apiList.isEmpty) {
                      setState(() {
                        disabled = false;
                      });
                      fetchContry3().then(
                        (value) {
                          setState(() {
                            disabled = true;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => choose(),
                            ),
                          );
                        },
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => choose(),
                        ),
                      );
                    }
                  }
                : null,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color.lerp(
                    Color.fromARGB(255, 7, 32, 105), Colors.black, 0.5),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/top.png'),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.3),
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                ScaleAnimatedText(
                  '画面をタップ',
                  textStyle: TextStyle(
                    color: Color.fromARGB(201, 242, 237, 237),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(0, -0.6),
            child: Text(
              'PlanetBox',
              style: TextStyle(
                color: Color.fromARGB(201, 242, 237, 237),
                fontSize: 50,
              ),
            ),
          )
        ],
      ),
    );
  }
}

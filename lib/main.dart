import 'package:flutter/material.dart';
import 'package:tataclassedge_task/constants/constants.dart';
import 'package:tataclassedge_task/pages/finished_screen.dart';
import 'package:tataclassedge_task/pages/quize_screen.dart';
import 'package:tataclassedge_task/pages/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        backgroundColor: Colors.indigo[900],
      ),
      initialRoute: Constants.SPLASH,
      routes: {
        Constants.SPLASH: (context) => SplashScreen(),
        Constants.QUIZE: (context) => QuizeScreen(),
        Constants.FINISHED: (context) => FinishedScreen(),
      },
    );
  }
}

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tataclassedge_task/animations/animated_background.dart';
import 'package:tataclassedge_task/animations/fade_animation.dart';
import 'package:tataclassedge_task/animations/scale_transition.dart';
import 'package:tataclassedge_task/constants/constants.dart';
import 'package:tataclassedge_task/ui/change_layout.dart';
import 'package:tataclassedge_task/utils/quize_brain.dart';

class QuizeScreen extends StatefulWidget {
  @override
  _QuizeScreenState createState() => _QuizeScreenState();
}

class _QuizeScreenState extends State<QuizeScreen>
    with SingleTickerProviderStateMixin {
  QuizeBrain _quizeBrain = new QuizeBrain();
  TextStyle _textStyle =
      TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
  List<bool> _isSelected = [true, false, false];

  int _countValue = 1;
  double _aspectWidth = 3.0;
  double _aspectHeight = 0.5;
  Timer _timer;
  int _start = 9;
  bool _next = false;
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            if (_quizeBrain.isFinished()) {
              timer.cancel();
              print('Finished');
              Navigator.of(context).pushReplacementNamed(Constants.FINISHED);
            } else {
              _next = _quizeBrain.nextQuestion();
              print('Next question');
              _start = 9;
            }
          } else {
            _next = false;
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  changeMode(int _count) {
    switch (_count) {
      case 1:
        setState(() {
          _countValue = 1;
          _aspectWidth = 3.0;
          _aspectHeight = 0.5;
        });

        break;

      case 2:
        setState(() {
          _countValue = 2;
          _aspectWidth = 3.0;
          _aspectHeight = 2.0;
        });

        break;

      case 4:
        setState(() {
          _countValue = 4;
          _aspectWidth = 1.0;
          _aspectHeight = 1.5;
        });

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: BackgroudAnimation(
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ScaleTransitionAnimation(
            ListView(
              children: [
                Container(
                  height: 200,
                  child: Stack(
                    children: <Widget>[
                      FadeTransitionAnimation(
                        1,
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/curve.png"),
                            ),
                          ),
                        ),
                      ),
                      ScaleTransitionAnimation(
                        Container(
                          height: 100,
                          margin: EdgeInsets.all(30),
                          alignment: Alignment.topCenter,
                          child: Center(
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                  style: _textStyle,
                                  children: [
                                    WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 5, 10, 5),
                                        child: Icon(
                                          Icons.games,
                                          color: Colors.white70,
                                        ),
                                      ),
                                    ),
                                    TextSpan(text: "MY QUIZ !"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FadeTransitionAnimation(
                  2,
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        _quizeBrain.getQuestion(),
                        style: _textStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ScaleTransitionAnimation(
                  ChangeLayout(_countValue, _quizeBrain.getOptions(),
                      _aspectWidth, _aspectHeight, _next),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    '00:0$_start',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.bottomCenter,
        height: 50,
        child: ToggleButtons(
          color: Colors.greenAccent,
          selectedColor: Colors.amberAccent,
          fillColor: Colors.purple,
          borderColor: Colors.white,
          borderWidth: 5,
          selectedBorderColor: Colors.greenAccent,
          renderBorder: true,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
          children: <Widget>[
            Container(
              width: (MediaQuery.of(context).size.width - 36) / 3,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Icon(
                    Icons.border_vertical,
                    size: 16.0,
                  ),
                  new SizedBox(
                    width: 4.0,
                  ),
                  new Text("Vertical")
                ],
              ),
            ),
            Container(
              width: (MediaQuery.of(context).size.width - 36) / 3,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Icon(
                    Icons.border_horizontal,
                    size: 16.0,
                  ),
                  new SizedBox(
                    width: 4.0,
                  ),
                  new Text("Horizontal")
                ],
              ),
            ),
            Container(
              width: (MediaQuery.of(context).size.width - 36) / 3,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Icon(
                    Icons.grid_on,
                    size: 16.0,
                  ),
                  new SizedBox(
                    width: 4.0,
                  ),
                  new Text("Grid")
                ],
              ),
            ),
          ],
          onPressed: (int index) {
            print("Print $index button");
            switch (index) {
              case 0:
                changeMode(1);
                break;
              case 1:
                changeMode(4);
                break;
              case 2:
                changeMode(2);
                break;
            }
            setState(() {
              for (int indexBtn = 0;
                  indexBtn < _isSelected.length;
                  indexBtn++) {
                if (indexBtn == index) {
                  _isSelected[indexBtn] = !_isSelected[indexBtn];
                } else {
                  _isSelected[indexBtn] = false;
                }
              }
            });
          },
          isSelected: _isSelected,
        ),
      ),
    );
  }
}

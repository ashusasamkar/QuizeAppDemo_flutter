import 'package:flutter/material.dart';
import 'package:tataclassedge_task/animations/scale_transition.dart';
import 'package:tataclassedge_task/constants/constants.dart';

class FinishedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ScaleTransitionAnimation(
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/done.png'),
              Text(
                'You have Done with the Quiz !',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () =>
                    Navigator.popAndPushNamed(context, Constants.SPLASH),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    height: 40,
                    width: 200,
                    color: Colors.white,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Restart Quiz',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.indigo[900],
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

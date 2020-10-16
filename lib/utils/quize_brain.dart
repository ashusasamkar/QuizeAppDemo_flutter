import 'package:tataclassedge_task/constants/constants.dart';
import 'package:tataclassedge_task/utils/questions.dart';

class QuizeBrain {
  int _qNumber = 0;

  static var data1 = Constants.json[0]['data'];
  static var data2 = Constants.json[1]['data'];
  List<Questions> _qusetionData = [
    Questions(
        question: data1['stimulus'],
        options: [
          data1['options'][0]['label'],
          data1['options'][1]['label'],
          data1['options'][2]['label'],
          data1['options'][3]['label']
        ],
        answer: data1['solution']['answer']),

    Questions(
        question: data2['stimulus'],
        options: [
          data2['options'][0]['label'],
          data2['options'][1]['label'],
          data2['options'][2]['label'],
          data2['options'][3]['label']
        ],
        answer: data2['solution']['answer']),
  ];
  bool nextQuestion(){
    if(_qNumber < _qusetionData.length-1){
      _qNumber++;
    }
    return true;

  }
  void reset(){
    _qNumber = 0;
  }

  bool isFinished(){
    if(_qNumber == (_qusetionData.length-1)){
      return true;
    }
    else
      return false;
  }

  String getQuestion(){
    return _qusetionData[_qNumber].question;
  }

  List<String> getOptions(){
    return _qusetionData[_qNumber].options;
  }

  String getAnswer(){
    return _qusetionData[_qNumber].answer;
  }
}

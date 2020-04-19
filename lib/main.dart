import 'package:flutter/material.dart';


import './quiz.dart';
import './result.dart';

//void main() {
//  runApp(MyApp());
//}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  var _questionIndex = 0;
  var _totalScore= 0;

  final _questions = [
      {
        'questionText': 'What\'s your favorite color?', 
        'answers':[
          {'text': 'Black', 'score': 10}, 
          {'text': 'Red', 'score':5}, 
          {'text': 'Green', 'score':3}, 
          {'text': 'White', 'score': 1}
        ]        
      },
      {
        'questionText': 'What\'s your favorite animal?', 
        'answers':[
          {'text': 'Cat', 'score': 5}, 
          {'text': 'Dog', 'score':3}, 
          {'text': 'Snake', 'score':10}, 
          {'text': 'Rabbit', 'score': 1}
        ]  
      }, 
      {
        'questionText': 'Who\'s your favorite instuructor?', 
        'answers':[
          {'text': 'Hus', 'score': 1}, 
          {'text': 'Hus', 'score':2}, 
          
        ]  
      },      
      
    ];

  
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
     _totalScore= 0;      
    });
     

  }


  void _answerQuestion(int score) {

    _totalScore += score;

    setState(() {
      _questionIndex++;
    });
    print('Answer chosen.');    
    print(_questionIndex);
    
  }

  @override
  Widget build(BuildContext context) {

    

    
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('First App'),
          ),
          body: _questionIndex < _questions.length 
          ? Quiz(
            answerQuestion: _answerQuestion,
            questions: _questions, 
            questionIndex: _questionIndex
            ) 
            : Result(_totalScore, _resetQuiz)
            ),
    );
  }
}

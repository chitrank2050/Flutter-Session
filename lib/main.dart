import 'package:flutter/material.dart';

import 'question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'Q': 'What\'s your favourite color?',
      'A': [
        {'text': 'Black', 'score': 4},
        {'text': 'Red', 'score': 3},
        {'text': 'Green', 'score': 2},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'Q': 'What\'s your favourite animal?',
      'A': [
        {'text': 'Deer', 'score': 4},
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Elephant', 'score': 2},
        {'text': 'Lion', 'score': 1}
      ],
    },
    {
      'Q': 'Who\'s your favourite instructor?',
      'A': [
        {'text': 'Max', 'score': 4},
        {'text': 'Dany', 'score': 3},
        {'text': 'Jin', 'score': 2},
        {'text': 'Tim', 'score': 1},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Demo'),
        ),
        body: Questions(
          onPressed: _answerQuestion,
          index: _questionIndex,
          questions: _questions,
        ),
      ),
    );
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
  }

  void _resetQuestions() {
    setState(() {
      _totalScore = _questionIndex = 0;
    });
  }
}

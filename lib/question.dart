import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function onPressed;
  final int index;

  const Questions({
    Key key,
    this.questions,
    this.onPressed,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Question(questions[index]['Q']),
        ...(questions[index]['A'] as List<Map<String, Object>>)
            .map((e) => Answer(
                  e['text'],
                  () => onPressed(e['score']),
                ))
            .toList()
      ],
    );
  }
}

class Question extends StatelessWidget {
  final String _question;

  Question(this._question);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      child: Text(
        _question,
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class Answer extends StatelessWidget {
  final Function callback;
  final String answer;

  Answer(this.answer, this.callback);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text(answer),
        color: Colors.amberAccent,
        textColor: Colors.black,
        onPressed: callback,
      ),
    );
  }
}

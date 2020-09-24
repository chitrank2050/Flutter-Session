import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';

class Answers extends StatefulWidget {
  final String correct;
  final String title;

  Answers(this.title, this.correct);

  @override
  _AnswersState createState() => _AnswersState();
}

class _AnswersState extends State<Answers> {
  Color c = Colors.black;

  void checkAnswer() {
    print(widget.title);
    print(widget.correct);
    setState(() {
      c = (widget.title == widget.correct) ? Colors.green : Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: checkAnswer,
      title: Text(
        HtmlUnescape().convert(widget.title),
        textAlign: TextAlign.center,
        style: TextStyle(color: c),
      ),
    );
  }
}

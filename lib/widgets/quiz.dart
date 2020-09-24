import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';

import 'package:demo/models/quiz.dart';
import 'package:demo/widgets/answers.dart';

class Quiz extends StatelessWidget {
  final List<Results> questions;

  Quiz(this.questions);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) => Card(
          color: Colors.white,
          elevation: 0.0,
          child: ExpansionTile(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  HtmlUnescape().convert(questions[index].question),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FilterChip(
                        onSelected: (b) {},
                        backgroundColor: Colors.grey[100],
                        label: Text(questions[index].category),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      FilterChip(
                        onSelected: (b) {},
                        backgroundColor: Colors.grey[100],
                        label: Text(questions[index].difficulty),
                      ),
                    ],
                  ),
                )
              ],
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.grey[100],
              child: Text(questions[index].type.substring(0, 1).toUpperCase()),
            ),
            children: <Widget>[
              ...questions[index].allAnswers.map((e) => Answers(
                    e,
                    questions[index].correctAnswer,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

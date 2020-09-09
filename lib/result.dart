import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function reset;

  String get resultPhrase {
    return 'Finished with questions!! \n SCORE: $score';
  }

  Result(this.score, this.reset);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          FlatButton(
            child: Text('Reload!'),
            textColor: Colors.blue,
            onPressed: reset,
          )
        ],
      ),
    );
  }
}

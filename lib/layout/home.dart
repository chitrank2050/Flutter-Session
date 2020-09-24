import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:demo/models/quiz.dart';
import 'package:demo/widgets/quiz.dart';
import 'package:demo/widgets/error.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Results>> _resultFuture;

  @override
  void initState() {
    super.initState();
    _resultFuture = fetchQuestions();
  }

  Future<Null> refreshQuestions() async {
    setState(() {
      _resultFuture = fetchQuestions();
    });
  }

  Future<List<Results>> fetchQuestions() async {
    var data = await http.get('https://opentdb.com/api.php?amount=20');
    return QuizModel.fromJson(jsonDecode(data.body)).results;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        elevation: 0.0,
      ),
      body: RefreshIndicator(
        child: FutureBuilder(
          future: _resultFuture,
          builder: (BuildContext ctx, AsyncSnapshot<List<Results>> snap) {
            switch (snap.connectionState) {
              case ConnectionState.none:
                return Text('Press button to start');
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                if (snap.hasError) return Error(snap);
                return Quiz(snap.data ?? <Results>[]);
            }
            return null;
          },
        ),
        onRefresh: refreshQuestions,
      ),
    );
  }
}

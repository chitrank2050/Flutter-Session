import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int count;

  const Counter({
    Key key,
    this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$count',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}

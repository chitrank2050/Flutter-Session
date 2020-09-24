import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  final AsyncSnapshot snapshot;

  Error(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Error: ${snapshot.error}'),
        ],
      ),
    );
  }
}

import 'package:demo/counter/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (BuildContext context, CounterState state) {
          if (state is CounterLoaded) {
            return Counter(count: state.count);
          }
          return Center(child: Text('Press button'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.bloc<CounterBloc>()..add(IncrementCounter()),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

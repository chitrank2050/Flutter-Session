part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  final int count;

  const CounterState(this.count);

  @override
  List<Object> get props => [count];
}

class CounterInitial extends CounterState {
  CounterInitial() : super(0);

  @override
  String toString() => '''CounterInitial''';
}

class CounterLoaded extends CounterState {
  CounterLoaded(int count) : super(count);

  @override
  String toString() => '''CounterLoaded''';
}

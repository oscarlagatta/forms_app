part of 'counter_bloc.dart';

abstract class CounterEvent {
  const CounterEvent();
}

class CounterIncreased extends CounterEvent {
  final int increasedBy;

  const CounterIncreased(this.increasedBy);
}

class CounterReset extends CounterEvent {
  const CounterReset();
}

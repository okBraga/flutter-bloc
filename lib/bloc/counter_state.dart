enum CounterStatus {
  initial,
  add,
  subtract,
  reset,
  multiply;
}

class CounterState {
  final CounterStatus status;
  final String message;
  final int counterValue;

  CounterState._({
    required this.status,
    this.message = '',
    required this.counterValue,
  });

  CounterState.initial()
      : this._(
            status: CounterStatus.initial,
            message: 'You have pushed the button this many times:',
            counterValue: 0);

  CounterState copyWith({
    CounterStatus? status,
    String? message,
    int? counterValue,
  }) {
    return CounterState._(
      status: status ?? this.status,
      message: message ?? this.message,
      counterValue: counterValue ?? this.counterValue,
    );
  }
}

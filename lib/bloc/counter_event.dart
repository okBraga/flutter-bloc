class CounterEvent {}

class CounterAddEvent extends CounterEvent {}

class CounterSubtractEvent extends CounterEvent {}

class CounterResetEvent extends CounterEvent {}

class CounterMultiplyEvent extends CounterEvent {
  int valor;

  CounterMultiplyEvent({
    required this.valor,
  });
}
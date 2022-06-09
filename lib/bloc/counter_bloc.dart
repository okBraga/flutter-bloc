import 'package:counter_bloc/bloc/counter_event.dart';
import 'package:counter_bloc/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<CounterAddEvent>(_adicionar);
    on<CounterSubtractEvent>(_subtract);
    on<CounterResetEvent>(_reset);
    on<CounterMultiplyEvent>(_multiply);
  }

  void _adicionar(CounterAddEvent, Emitter<CounterState> emitter) {
    var currentCounter = state.counterValue;
    currentCounter += 1;
    emitter(state.copyWith(
        counterValue: currentCounter, status: CounterStatus.add));
  }

  void _subtract(CounterSubtractEvent, Emitter<CounterState> emitter) {
    var currentCounter = state.counterValue;
    currentCounter -= 1;
    emitter(state.copyWith(
        counterValue: currentCounter, status: CounterStatus.subtract));
  }

  void _reset(CounterResetEvent, Emitter<CounterState> emitter) {
    emitter(state.copyWith(counterValue: 0, status: CounterStatus.reset));
  }

  void _multiply(CounterMultiplyEvent event, Emitter<CounterState> emitter) {
    var currentCounter = state.counterValue;
    currentCounter *= event.valor;
    emitter(state.copyWith(
        counterValue: currentCounter, status: CounterStatus.multiply));
  }
}

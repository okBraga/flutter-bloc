import 'package:counter_bloc/bloc/counter_bloc.dart';
import 'package:counter_bloc/bloc/counter_event.dart';
import 'package:counter_bloc/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterBloc, CounterState>(
      listener: (context, state) {
        String message = '';

        switch (state.status) {
          case CounterStatus.initial:
            message = 'Estado inicial';
            break;
          case CounterStatus.add:
            message = 'Adicionando um valor';
            break;
          case CounterStatus.subtract:
            message = 'subtraindo um valor';
            break;
          case CounterStatus.reset:
            message = 'Reiniciado';
            break;
          case CounterStatus.multiply:
            message = 'Multiplicando por 2';
            break;
        }

        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message)));
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Counter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocSelector<CounterBloc, CounterState, String>(
                  selector: (state) => state.message,
                  builder: (context, String message) {
                    return Text(
                      message,
                    );
                  }),
              BlocSelector<CounterBloc, CounterState, int>(
                  selector: (state) => state.counterValue,
                  builder: (context, int counter) {
                    return Text('$counter',
                        style: Theme.of(context).textTheme.headline4);
                  }),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 5,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(CounterAddEvent());
                        },
                        child: Text('Adicionar')),
                    ElevatedButton(
                        onPressed: () {
                          context
                              .read<CounterBloc>()
                              .add(CounterSubtractEvent());
                        },
                        child: Text('Subtrair')),
                    ElevatedButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(CounterResetEvent());
                        },
                        child: Text('Reiniciar')),
                    ElevatedButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(CounterMultiplyEvent(valor: 2));
                        }, child: Text('Multiplicar por 2')),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

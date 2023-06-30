import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {

  //Constructor         inicializa el estado
  CounterBloc() : super(const CounterState()) {
    // Cuerpo del constructor 
    on<CounterIncreased>((event, emit) {
      emit(state.copyWith(
        counter: state.counter + event.value,
        transactionCount: state.transactionCount + 1
      ));
    });
  }
}

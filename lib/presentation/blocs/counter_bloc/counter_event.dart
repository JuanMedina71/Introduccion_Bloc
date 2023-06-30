part of 'counter_bloc.dart';

// El event es util porque nos permite decir que tipo de eventos va a recibir mi Bloc.


// Cuando ya tienes instalado Equatable te lo agrega directamente al crear un nuevo Bloc
abstract class CounterEvent extends Equatable {


  const CounterEvent();

  @override
  List<Object> get props => [];
}

class CounterIncreased extends CounterEvent {
  final int value;
  const CounterIncreased(this.value);
}

class CounterReset extends CounterEvent {
  
}

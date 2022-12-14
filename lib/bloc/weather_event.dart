part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class OnPageChangedEvent extends WeatherEvent {
  final int index;
  const OnPageChangedEvent({
    required this.index,
  });

  @override
  List<Object> get props => [index];
}



class InitEvent extends WeatherEvent {}

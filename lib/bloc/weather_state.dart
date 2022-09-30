part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  final List<WeatherLocation> weatherlocations;
  final int i;
  const WeatherState({
    this.i = 0,
    this.weatherlocations = const [],
  });

  WeatherState copyWith({List<WeatherLocation>? massive, int? i}) {
    return WeatherState(
      i: i ?? this.i,
      weatherlocations: massive ?? weatherlocations,
    );
  }

  @override
  List<Object> get props => [weatherlocations, i];
  
}

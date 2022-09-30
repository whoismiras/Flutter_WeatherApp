import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/models/weather_locations.dart';

import '../data/weatherData.dart';
import '../screens/weather_app.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  var client = WeatherData();
  List<WeatherLocation> weatherLocation = [];

  static const List<Location> positions = [
    Location(
      latitude: "43.23",
      longitude: "76.88",
    ),
    Location(
      latitude: "19.74",
      longitude: "-155.85",
    ),
    Location(
      latitude: "40.73",
      longitude: "-73.93",
    ),
    Location(
      latitude: "51.30",
      longitude: "-0.14",
    ),
  ];

  WeatherBloc() : super(const WeatherState()) {
    on<OnPageChangedEvent>(_onPageChanged);
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<WeatherState> emit) async {
    for (var i in positions) {
      final data = await client.getData(i.latitude, i.longitude);
      final massive1 = [...state.weatherlocations, data];

      emit(state.copyWith(i: 0, massive: massive1));
    }
  }

  void _onPageChanged(
      OnPageChangedEvent event, Emitter<WeatherState> emit) async {
    emit(state.copyWith(i: event.index));
  }


}

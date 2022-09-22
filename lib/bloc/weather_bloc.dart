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

  WeatherBloc() : super(const WeatherState()) {
    on<OnPageChangedEvent>(_onPageChanged);
    on<InfoEvent>(_info);
  }

  void _onPageChanged(OnPageChangedEvent event, Emitter<WeatherState> emit) {
    print(event.index);
    emit(state.copyWith(
      i: event.index,
    ));
  }

  void _info(InfoEvent event, Emitter<WeatherState> emit) async {
    final data =
        await client.getData(event.location.latitude, event.location.longitude);
    weatherLocation.add(data);
    print(event.location);
    emit(state.copyWith(
      massive: weatherLocation,
    ));
  }
}

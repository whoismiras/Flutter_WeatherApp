// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:weather_app/models/weather_locations.dart';
import 'package:weather_app/widgets/single_weather.dart';

import '../bloc/weather_bloc.dart';
import '../widgets/slider_dot.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  late String bgImg = 'assets/images/sunny.jpg';

  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(InitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: const Text(''),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: GestureDetector(
                  // ignore: avoid_print
                  onTap: () => print('Menu Clicked!'),
                  child: SvgPicture.asset(
                    'assets/images/menu.svg',
                    height: 30,
                    width: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          body: Stack(
            children: [
              Image.asset(
                bgImg,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black38,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 140, left: 15),
                child: Row(
                  children: [
                    for (int i = 0; i < state.weatherlocations.length; i++)
                      if (i == state.i) SliderDot(true) else SliderDot(false)
                  ],
                ),
              ),
              PageView.builder(
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) {
                  context
                      .read<WeatherBloc>()
                      .add(OnPageChangedEvent(index: index));
                },
                itemCount: state.weatherlocations.length,
                itemBuilder: (ctx, i) {
                  return SingleWeather(data: state.weatherlocations[i]);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class Location {
  final String longitude;
  final String latitude;
  @override
  String toString() {
    return '$longitude, $latitude';
  }

  const Location({required this.longitude, required this.latitude});
}

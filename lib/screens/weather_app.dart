// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/widgets/single_weather.dart';

import '../widgets/slider_dot.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final List<Location> positions = [
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
      latitude: "48.86",
      longitude: "2.34",
    ),
  ];

  int _currentPage = 0;
  late String bgImg = 'assets/images/sunny.jpg';

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                for (int i = 0; i < positions.length; i++)
                  if (i == _currentPage) SliderDot(true) else SliderDot(false)
              ],
            ),
          ),
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onPageChanged,
            itemCount: positions.length,
            itemBuilder: (ctx, i) => SingleWeather(position: positions[i]),
          ),
        ],
      ),
    );
  }
}

class Location {
  final String longitude;
  final String latitude;

  Location({required this.longitude, required this.latitude});
}

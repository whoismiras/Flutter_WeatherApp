// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/models/weather_locations.dart';
import 'package:weather_app/widgets/single_weather.dart';

import '../widgets/slider_dot.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  int _currentPage = 0;
  late String bgImg = 'assets/images/sunny.jpg';

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // if (locationList[_currentPage].weatherType == 'Sunny') {
    //   bgImg = 'assets/images/sunny.jpg';
    // } else if (locationList[_currentPage].weatherType == 'Night') {
    //   bgImg = 'assets/images/night.jpg';
    // } else if (locationList[_currentPage].weatherType == 'Cloudy') {
    //   bgImg = 'assets/images/cloudy.jpg';
    // } else if (locationList[_currentPage].weatherType == 'Rainy') {
    //   bgImg = 'assets/images/rainy.jpg';
    // }

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
                for (int i = 0; i < locationList.length; i++)
                  if (i == _currentPage) SliderDot(true) else SliderDot(false)
              ],
            ),
          ),
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onPageChanged,
            itemCount: locationList.length,
            itemBuilder: (ctx, i) => const SingleWeather(),
          ),
        ],
      ),
    );
  }
}

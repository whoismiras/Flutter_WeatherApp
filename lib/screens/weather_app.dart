import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather_locations.dart';
import 'package:weather_app/widgets/single_weather.dart';

import '../data/weatherData.dart';
import '../widgets/slider_dot.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  // final index;
  // WeatherApp(this.index);

  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  // ignore: prefer_final_fields
  final List<WeatherLocation> locationList = [];
  int _currentPage = 0;
  late String bgImg = 'assets/images/sunny.jpg';
  var client = WeatherData();
  WeatherLocation? data;

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  info() async {
    var position = await Geolocator.getCurrentPosition();
    print(position);
    EasyLoading.show(status: 'loading...');
    //data = await client.getData(position.latitude, position.longitude);

    if (_currentPage == 0) {
      data = await client.getData('43.24', '76.89');
    } else if (_currentPage == 1) {
      data = await client.getData('19.74', '-155.85');
    }
    setState(() {});
    locationList.add(data!);
    return data;
  }

  @override
  void initState() {
    super.initState();
    info();
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
                for (int i = 0; i < 4; i++)
                  if (i == _currentPage) SliderDot(true) else SliderDot(false)
              ],
            ),
          ),
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onPageChanged,
            itemCount: 4,
            itemBuilder: (ctx, i) =>
                SingleWeather(weatherLocation: locationList[i]),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: avoid_print, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/data/weatherData.dart';
import 'package:weather_app/screens/weather_app.dart';

import '../models/weather_locations.dart';

var dayInfo = DateTime.now();
var dateFormat = DateFormat('EEEE, d MMM,  yyyy').format(dayInfo);

class SingleWeather extends StatefulWidget {
  const SingleWeather({required this.position, super.key});
  final Location position;

  @override
  State<SingleWeather> createState() => _SingleWeatherState();
}

class _SingleWeatherState extends State<SingleWeather> {
  var client = WeatherData();
  WeatherLocation? data;

  info() async {
    EasyLoading.show(status: 'loading...');

    data = await client.getData(
        widget.position.latitude, widget.position.longitude);

    setState(() {});
    return data;
  }

  @override
  void initState() {
    super.initState();
    client = WeatherData();
    info();
  }

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return const SizedBox();
    }
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    Text(
                      // '${data?.city}',
                      data!.city,
                      style: GoogleFonts.lato(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      dateFormat,
                      //locationList[index].dateTime,
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                //'${data?.temperature}' '\u2103',

                '${data!.temperature}\u2103',
                style: GoogleFonts.lato(
                  fontSize: 85,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
              Row(
                children: [
                  // SvgPicture.asset(
                  //   widget.weatherLocation.iconUrl,
                  //   width: 34,
                  //   height: 34,
                  //   color: Colors.white,
                  // ),
                  Image.network(
                    'http:${data!.iconUrl}',
                    width: 34,
                    height: 34,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    // '${data?.weatherType}',
                    data!.weatherType,
                    style: GoogleFonts.lato(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 40,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Wind',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          //'${data?.wind}',
                          data!.wind.toString(),
                          style: GoogleFonts.lato(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'km/h',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 5,
                              width: 50,
                              color: Colors.white38,
                            ),
                            Container(
                              height: 5,
                              width: 5,
                              color: Colors.greenAccent,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Rain',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          //'${data?.rain}',
                          data!.rain.toString(),
                          style: GoogleFonts.lato(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '%',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 5,
                              width: 50,
                              color: Colors.white38,
                            ),
                            Container(
                              height: 5,
                              width: 5,
                              color: Colors.redAccent,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Humidity',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          //'${data?.humidity}',
                          data!.humidity.toString(),
                          style: GoogleFonts.lato(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '%',
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 5,
                              width: 50,
                              color: Colors.white38,
                            ),
                            Container(
                              height: 5,
                              width: 5,
                              color: Colors.redAccent,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

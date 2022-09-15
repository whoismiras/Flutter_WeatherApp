// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_locations.dart';
import 'package:weather_app/data/weatherData.dart';

var dayInfo = DateTime.now();
var dateFormat = DateFormat('EEEE, d MMM,  yyyy').format(dayInfo);

class SingleWeather extends StatefulWidget {
  const SingleWeather({super.key});

  @override
  State<SingleWeather> createState() => _SingleWeatherState();
}

class _SingleWeatherState extends State<SingleWeather> {
  var client = WeatherData();
  WeatherLocation? data;

  info() async {
    var position = await Geolocator.getCurrentPosition();
    print(position);
    EasyLoading.show(status: 'loading...');
    //data = await client.getData(position.latitude, position.longitude);
    data = await client.getData('43.24', '76.89');
    setState(() {});
    return data;
  }

  @override
  void initState() {
    super.initState();
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
                      '${data?.city}',
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
                '${data?.temperature}' '\u2103',
                // locationList[index].temperature,
                style: GoogleFonts.lato(
                  fontSize: 85,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
              Row(
                children: [
                  // SvgPicture.asset(
                  //   locationList[index].iconUrl,
                  //   width: 34,
                  //   height: 34,
                  //   color: Colors.white,
                  // ),
                  Image.network(
                    'http:${data?.iconUrl}',
                    width: 34,
                    height: 34,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${data?.weatherType}',
                    // locationList[index].weatherType,
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
                          '${data?.wind}',
                          // locationList[index].wind.toString(),
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
                          '${data?.rain}',
                          //locationList[index].rain.toString(),
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
                          '${data?.humidity}',
                          //locationList[index].humidity.toString(),
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

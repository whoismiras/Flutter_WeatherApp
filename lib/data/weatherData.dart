// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_locations.dart';

class WeatherData {
  Future<WeatherLocation> getData(var latitude, var longitude) async {
    var uriCall = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=c60c6daf523f405c9cf153423222609&q=$latitude,$longitude&aqi=no');
    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);
    EasyLoading.dismiss();
    return WeatherLocation.fromJson(body);
  }
}

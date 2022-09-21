class WeatherLocation {
  final String city;
  final String dateTime;
  final num temperature;
  final String weatherType;
  final String iconUrl;
  final num wind;
  final num rain;
  final num humidity;

  WeatherLocation({
    required this.city,
    required this.dateTime,
    required this.temperature,
    required this.weatherType,
    required this.iconUrl,
    required this.wind,
    required this.rain,
    required this.humidity,
  });

  factory WeatherLocation.fromJson(Map<String, dynamic> json) =>
      WeatherLocation(
          city: json['location']['region'],
          dateTime: json['current']['last_updated'],
          temperature: json['current']['temp_c'],
          weatherType: json['current']['condition']['text'],
          iconUrl: json['current']['condition']['icon'],
          wind: json['current']['wind_kph'],
          rain: json['current']['cloud'],
          humidity: json['current']['humidity']);

  getData(double latitude, double longitude) {}
}

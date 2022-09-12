class WeatherLocation {
  final String city;
  final String dateTime;
  final String temperature;
  final String weatherType;
  final String iconUrl;
  final int wind;
  final int rain;
  final int humidity;

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
}

final locationList = [
  WeatherLocation(
    city: 'Almaty',
    dateTime: '07:50 PM - Monday, 10 Sep 2022',
    temperature: '20\u2103',
    weatherType: 'Night',
    iconUrl: 'assets/images/moon.svg',
    wind: 10,
    rain: 2,
    humidity: 10,
  ),
  WeatherLocation(
    city: 'Hawaii',
    dateTime: '02:40 PM - Monday, 10 Sep 2022',
    temperature: '28\u2103',
    weatherType: 'Sunny',
    iconUrl: 'assets/images/sunny.svg',
    wind: 8,
    rain: 2,
    humidity: 82,
  ),
  WeatherLocation(
    city: 'London',
    dateTime: '09:40 AM - Monday, 10 Sep 2022',
    temperature: '15\u2103',
    weatherType: 'Cloudy',
    iconUrl: 'assets/images/cloudy.svg',
    wind: 9,
    rain: 20,
    humidity: 62,
  ),
  WeatherLocation(
    city: 'Paris',
    dateTime: '07:24 AM - Monday, 10 Sep 2022',
    temperature: '18\u2103',
    weatherType: 'Rainy',
    iconUrl: 'assets/images/Rrainy.svg',
    wind: 10,
    rain: 95,
    humidity: 75,
  ),
];

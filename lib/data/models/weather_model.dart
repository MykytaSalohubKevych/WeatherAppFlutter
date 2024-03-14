import 'package:equatable/equatable.dart';
import 'package:my_weather_app/domain/entities/weather.dart';

class WeatherModel extends Equatable {
  final String cityName;
  final String date;
  final String weather;
  final String weatherDescription;
  final String temperature;
  final String minTemperature;
  final String maxTemperature;
  final String feelTemperature;
  final String sunrise;
  final String sunset;
  final String icon;
  final int cond;

  const WeatherModel(
      {required this.cityName,
      required this.date,
      required this.weather,
      required this.weatherDescription,
      required this.temperature,
      required this.minTemperature,
      required this.maxTemperature,
      required this.feelTemperature,
      required this.sunrise,
      required this.sunset,
      required this.icon,
      required this.cond});

  @override
  List<Object?> get props => [
        cityName,
        date,
        weather,
        weatherDescription,
        temperature,
        minTemperature,
        maxTemperature,
        feelTemperature,
        sunrise,
        sunset,
        icon,
        cond
      ];

  WeatherEntity toEntity() {
    return WeatherEntity(
        cityName: cityName,
        date: date,
        weather: weather,
        weatherDescription: weatherDescription,
        temperature: temperature,
        minTemperature: minTemperature,
        maxTemperature: maxTemperature,
        feelTemperature: feelTemperature,
        sunrise: sunrise,
        sunset: sunset,
        icon: icon,
        cond: cond);
  }

  factory WeatherModel.fromJson(Map<String, dynamic> jsonMap) {
    return WeatherModel(
        cityName: jsonMap['name'],
        date: DateTime.fromMillisecondsSinceEpoch(jsonMap['dt'] * 1000)
            .toString(),
        weather: jsonMap['weather'][0]['main'],
        weatherDescription: jsonMap['weather'][0]['description'],
        temperature: jsonMap['main']['temp'].toString(),
        minTemperature: jsonMap['main']['temp_min'].toString(),
        maxTemperature: jsonMap['main']['temp_max'].toString(),
        feelTemperature: jsonMap['main']['feels_like'].toString(),
        sunrise: DateTime.fromMillisecondsSinceEpoch(
                jsonMap['sys']['sunrise'] * 1000)
            .toString(),
        sunset:
            DateTime.fromMillisecondsSinceEpoch(jsonMap['sys']['sunset'] * 1000)
                .toString(),
        icon: jsonMap['weather'][0]['icon'],
        cond: jsonMap['weather'][0]['id']);
  }
}

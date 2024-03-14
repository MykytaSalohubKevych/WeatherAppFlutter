import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
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

  const WeatherEntity(
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
}

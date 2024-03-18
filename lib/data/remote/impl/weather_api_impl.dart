import 'dart:io';

import 'package:logger/logger.dart';
import 'package:weather/weather.dart';
import 'package:my_weather_app/data/models/weather_model.dart';
import 'package:my_weather_app/data/remote/weather_api.dart';
import 'package:intl/intl.dart';
import '../../util/constants.dart';
import '../../util/failure.dart';

class WeatherApiImpl implements WeatherApi {
  var logger = Logger();
  final String _api = Constants.API_KEY;

  String get api => _api;
  late final WeatherFactory factory = WeatherFactory(_api);

  @override
  Future<WeatherModel> getWeather(String cityName) async {
    try {
      final weather = await factory.currentWeatherByCityName(cityName);
      logger.d('From API $weather');
      return WeatherModel(
          cityName: cityName,
          date: DateFormat('dd MMMM yyyy').format(weather.date!),
          weather: weather.weatherMain.toString(),
          weatherDescription: weather.weatherDescription.toString(),
          temperature: weather.temperature!.celsius!.floor().toString(),
          minTemperature: weather.tempMin!.celsius!.floor().toString(),
          maxTemperature: weather.tempMax!.celsius!.floor().toString(),
          feelTemperature: weather.tempFeelsLike!.celsius!.floor().toString(),
          sunrise: DateFormat('hh:mm').format(weather.sunrise!),
          sunset: DateFormat('hh:mm').format(weather.sunset!),
          icon: weather.weatherIcon.toString(),
          cond: weather.weatherConditionCode!);
    } on SocketException {
      throw const ServerFailure('Something went wrong');
    }
  }
}

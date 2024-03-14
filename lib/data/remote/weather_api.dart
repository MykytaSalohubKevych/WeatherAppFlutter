
import 'package:my_weather_app/data/models/weather_model.dart';

abstract class WeatherApi {
  Future<WeatherModel> getWeather(String cityName);
}
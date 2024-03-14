import 'package:either_dart/either.dart';
import 'package:my_weather_app/data/util/failure.dart';
import 'package:my_weather_app/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> getCurrentWeather(String cityName);
}

import 'package:either_dart/either.dart';
import 'package:my_weather_app/data/util/failure.dart';
import 'package:my_weather_app/domain/entities/weather.dart';
import 'package:my_weather_app/domain/repository/weather_repository.dart';

class GetCurrentWeather {
  final WeatherRepository repository;

  GetCurrentWeather(this.repository);

  Future<Either<Failure, WeatherEntity>> execute(String cityName) {
    return repository.getCurrentWeather(cityName);
  }
}
import 'dart:math';

import 'package:either_dart/src/either.dart';
import 'package:weather/weather.dart';
import 'package:my_weather_app/data/remote/weather_api.dart';
import 'package:my_weather_app/data/util/failure.dart';
import 'package:my_weather_app/domain/entities/weather.dart';
import 'package:my_weather_app/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApi weatherApi;

  const WeatherRepositoryImpl({required this.weatherApi});

  @override
  Future<Either<Failure, WeatherEntity>> getCurrentWeather(String cityName) async {
    try {
      final result = await weatherApi.getWeather(cityName);


      return Right(result.toEntity());
    } on OpenWeatherAPIException {
      return const Left(ServerFailure('Something went wrong'));
    } on ServerFailure {
      return const Left(ServerFailure('Something went wrong'));
    }
  }
}

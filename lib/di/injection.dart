import 'package:get_it/get_it.dart';
import 'package:my_weather_app/data/remote/impl/weather_api_impl.dart';
import 'package:my_weather_app/data/remote/weather_api.dart';
import 'package:my_weather_app/data/repository/weather_repository_impl.dart';
import 'package:my_weather_app/domain/repository/weather_repository.dart';
import 'package:my_weather_app/domain/usecase/get_weather.dart';
import 'package:my_weather_app/presentation/bloc/weather_bloc.dart';

final locator = GetIt.instance;

void init() {
  locator.registerFactory(() => WeatherBloc(locator()));

  locator.registerLazySingleton(() => GetCurrentWeather(locator()));

  locator.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(weatherApi: locator()));

  locator.registerLazySingleton<WeatherApi>(() => WeatherApiImpl());
}

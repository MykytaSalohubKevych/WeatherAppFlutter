import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_weather_app/domain/entities/weather.dart';

import '../../domain/usecase/get_weather.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetCurrentWeather _getCurrentWeather;

  WeatherBloc(this._getCurrentWeather) : super(WeatherEmpty()) {
    on<OnCityChanged>((event, emit) async {
      final cityName = event.cityName;
      emit(WeatherLoading());

      final result = await _getCurrentWeather.execute(cityName);
      result.fold((failure) => emit(WeatherError(failure.message)),
          (data) => emit(WeatherHasData(data)));
    });
  }
}

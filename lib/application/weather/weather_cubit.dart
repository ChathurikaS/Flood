import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_application_1/core/extensions/dartz_x.dart';
import 'package:flutter_application_1/domain/failure/failure.dart';
import 'package:flutter_application_1/domain/weather/forecast/forecast.dart';
import 'package:flutter_application_1/domain/weather/i_weather_repo.dart';
import 'package:flutter_application_1/domain/weather/weather.dart';

part 'weather_state.dart';
part 'weather_cubit.freezed.dart';

@injectable
class WeatherCubit extends Cubit<WeatherState> {
  final IWeatherRepo _weatherRepo;
  WeatherCubit(
    this._weatherRepo,
  ) : super(const WeatherState.loading());

  Future<void> loadWeather(String city) async {
    emit(const WeatherState.loading());
    final failureOrWeather = await _weatherRepo.getWeather(city);
    if (failureOrWeather.isLeft()) {
      emit(WeatherState.failed(failure: failureOrWeather.getLeft()));
      return;
    }
    final failureOrForecast = await _weatherRepo.getForecast(city);
    if (failureOrForecast.isLeft()) {
      emit(WeatherState.failed(failure: failureOrForecast.getLeft()));
      return;
    }
    emit(WeatherState.loaded(
      weather: failureOrWeather.getOrCrash(),
      forecast: failureOrForecast.getOrCrash(),
    ));
  }
}

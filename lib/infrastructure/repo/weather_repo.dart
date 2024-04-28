import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_application_1/domain/failure/failure.dart';
import 'package:flutter_application_1/domain/weather/forecast/forecast.dart';
import 'package:flutter_application_1/domain/weather/i_weather_repo.dart';
import 'package:flutter_application_1/domain/weather/weather.dart';
import 'package:flutter_application_1/infrastructure/services/weather/weather_service.dart';

@LazySingleton(as: IWeatherRepo)
class WeatherRepo implements IWeatherRepo {
  final WeatherService _weatherService;

  WeatherRepo(this._weatherService);

  @override
  Future<Either<Failure, List<Forecast>>> getForecast(String city) =>
      _weatherService.getForecast(city);

  @override
  Future<Either<Failure, Weather>> getWeather(String city) =>
      _weatherService.getWeather(city);
}

import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/domain/failure/failure.dart';
import 'package:flutter_application_1/domain/weather/forecast/forecast.dart';
import 'package:flutter_application_1/domain/weather/weather.dart';

abstract class IWeatherRepo {
  Future<Either<Failure, Weather>> getWeather(String city);
  Future<Either<Failure, List<Forecast>>> getForecast(String city);
}

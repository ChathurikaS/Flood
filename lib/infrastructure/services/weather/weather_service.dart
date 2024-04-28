import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_application_1/domain/failure/failure.dart';
import 'package:flutter_application_1/domain/weather/forecast/forecast.dart';
import 'package:flutter_application_1/domain/weather/weather.dart';
import 'package:flutter_application_1/infrastructure/services/weather/dtos/forecast/forecast_dto.dart';
import 'package:flutter_application_1/infrastructure/services/weather/weather_api_client.dart';
import 'package:flutter_application_1/infrastructure/services/weather/dtos/weather/weather_dto.dart';

@lazySingleton
class WeatherService {
  final WeatherApiClient _client;

  WeatherService(this._client);

  Future<Either<Failure, Weather>> getWeather(String city) async {
    try {
      final weather = await _client.weather.get('&q=$city,LK&units=metric');
      return right(WeatherDto.fromJson(weather.data).toDomain());
    } catch (e) {
      return left(const Failure(message: 'Failed to get weather data'));
    }
  }

  Future<Either<Failure, List<Forecast>>> getForecast(String city) async {
    try {
      final forecast = await _client.forecast.get('&q=$city,LK&units=metric');
      final List<dynamic> data = forecast.data['list'];
      final List<ForecastDto> list = data
          .map((e) => ForecastDto.fromJson(e as Map<String, dynamic>))
          .toList();
      final filtered =
          list.where((element) => element.dtText.contains("09:00:00")).toList();
      return right(filtered.map((e) => e.toDomain()).toList());
    } catch (e) {
      return left(const Failure(message: 'Failed to get forecast data'));
    }
  }
}

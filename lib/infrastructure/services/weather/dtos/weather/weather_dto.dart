import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_application_1/domain/weather/weather.dart';
import 'package:flutter_application_1/infrastructure/services/weather/keys/main/main_key.dart';
import 'package:flutter_application_1/infrastructure/services/weather/keys/weather/weather_key.dart';
part 'weather_dto.freezed.dart';
part 'weather_dto.g.dart';

@freezed
abstract class WeatherDto with _$WeatherDto {
  const WeatherDto._();
  const factory WeatherDto({
    required List<WeatherKey> weather,
    required MainKey main,
  }) = _WeatherDto;
  factory WeatherDto.fromJson(Map<String, Object?> json) =>
      _$WeatherDtoFromJson(json);

  Weather toDomain() {
    return Weather(
      title: weather[0].main,
      icon: weather[0].icon,
      temp: _tempStr(main.temp),
      maxTemp: _tempStr(main.tempMax),
      humidity: main.humidity.toString(),
    );
  }

  String _tempStr(double temp) {
    return "${temp.toStringAsFixed(0)}°C";
  }
}

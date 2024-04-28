// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_1/domain/weather/forecast/forecast.dart';
import 'package:flutter_application_1/infrastructure/services/weather/keys/main/main_key.dart';
import 'package:flutter_application_1/infrastructure/services/weather/keys/weather/weather_key.dart';

part 'forecast_dto.freezed.dart';
part 'forecast_dto.g.dart';

@freezed
abstract class ForecastDto with _$ForecastDto {
  const ForecastDto._();
  const factory ForecastDto({
    @JsonKey(name: "dt") required int date,
    required List<WeatherKey> weather,
    required MainKey main,
    @JsonKey(name: "dt_txt") required String dtText,
  }) = _ForecastDto;
  factory ForecastDto.fromJson(Map<String, Object?> json) =>
      _$ForecastDtoFromJson(json);

  Forecast toDomain() {
    return Forecast(
      day: day,
      icon: weather[0].icon,
      temp: _tempStr(main.temp),
    );
  }

  String _tempStr(double temp) {
    return "${temp.toStringAsFixed(0)}°C";
  }

  String get day {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(date * 1000);
    var formatter = DateFormat('E');
    return formatter.format(dateTime);
  }
}

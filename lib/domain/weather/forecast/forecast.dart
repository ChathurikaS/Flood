import 'package:freezed_annotation/freezed_annotation.dart';
part 'forecast.freezed.dart';
part 'forecast.g.dart';

@freezed
abstract class Forecast with _$Forecast {
  const factory Forecast({
    required String day,
    required String icon,
    required String temp,
  }) = _Forecast;
  factory Forecast.fromJson(Map<String, Object?> json) =>
      _$ForecastFromJson(json);
}

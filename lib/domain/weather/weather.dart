import 'package:freezed_annotation/freezed_annotation.dart';
part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
abstract class Weather with _$Weather {
  const factory Weather({
    required String title,
    required String icon,
    required String temp,
    required String maxTemp,
    required String humidity,
  }) = _Weather;
  factory Weather.fromJson(Map<String, Object?> json) =>
      _$WeatherFromJson(json);
}

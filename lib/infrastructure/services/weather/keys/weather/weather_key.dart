import 'package:freezed_annotation/freezed_annotation.dart';
part 'weather_key.freezed.dart';
part 'weather_key.g.dart';

@freezed
abstract class WeatherKey with _$WeatherKey {
  const factory WeatherKey({
    required int id,
    required String main,
    required String description,
    required String icon,
  }) = _WeatherKey;
  factory WeatherKey.fromJson(Map<String, Object?> json) =>
      _$WeatherKeyFromJson(json);
}

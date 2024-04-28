// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_key.freezed.dart';
part 'main_key.g.dart';

@freezed
abstract class MainKey with _$MainKey {
  const factory MainKey({
    required double temp,
    @JsonKey(name: "feels_like") required double feelsLike,
    @JsonKey(name: "temp_min") required double tempMin,
    @JsonKey(name: "temp_max") required double tempMax,
    required int pressure,
    required int humidity,
  }) = _MainKey;
  factory MainKey.fromJson(Map<String, Object?> json) =>
      _$MainKeyFromJson(json);
}

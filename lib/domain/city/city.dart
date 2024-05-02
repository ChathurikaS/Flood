import 'package:freezed_annotation/freezed_annotation.dart';
part 'city.freezed.dart';
part 'city.g.dart';

@freezed
abstract class City with _$City {
  const factory City(
      {required String id,
      required String name,
      required int rainfall}) = _City;
  factory City.fromJson(Map<String, Object?> json) => _$CityFromJson(json);
}

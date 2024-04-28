part of 'select_city_cubit.dart';

enum CityUpdateState { loading, success, failed, init }

@freezed
abstract class SelectCityState with _$SelectCityState {
  const factory SelectCityState({
    required List<String> cities,
    required CityUpdateState cityUpdateState,
    required Option<Failure> failure,
  }) = _SelectCity;
}

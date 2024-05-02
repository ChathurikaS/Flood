part of 'cities_cubit.dart';

@freezed
class CitiesState with _$CitiesState {
  const factory CitiesState.loading() = _Loading;
  const factory CitiesState.loaded(List<City> cities) = _Loaded;
  const factory CitiesState.failed(Failure failure) = _Failed;
}

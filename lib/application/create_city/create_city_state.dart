part of 'create_city_cubit.dart';

@freezed
class CreateCityState with _$CreateCityState {
  const factory CreateCityState.initial() = _Initial;
  const factory CreateCityState.loading() = _Loading;
  const factory CreateCityState.succeed() = _Succeed;
  const factory CreateCityState.failed(Failure failure) = _Failed;
}

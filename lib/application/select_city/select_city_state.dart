part of 'select_city_cubit.dart';

@freezed
abstract class SelectCityState with _$SelectCityState {
  const factory SelectCityState.initial() = _Initial;
  const factory SelectCityState.loading() = _Loading;
  const factory SelectCityState.succeed() = _Succeed;
  const factory SelectCityState.failed(Failure failure) = _Failed;
}

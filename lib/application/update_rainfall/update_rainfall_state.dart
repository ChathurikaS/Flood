part of 'update_rainfall_cubit.dart';

@freezed
class UpdateRainfallState with _$UpdateRainfallState {
  const factory UpdateRainfallState.initial() = _Initial;
  const factory UpdateRainfallState.loading() = _Loading;
  const factory UpdateRainfallState.succeed() = _Succeed;
  const factory UpdateRainfallState.failed(Failure failure) = _Failed;
}

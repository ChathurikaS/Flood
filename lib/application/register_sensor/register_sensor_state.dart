part of 'register_sensor_cubit.dart';

@freezed
class RegisterSensorState with _$RegisterSensorState {
  const factory RegisterSensorState.initial() = _Initial;
  const factory RegisterSensorState.loading() = _Loading;
  const factory RegisterSensorState.succeed() = _Succeed;
  const factory RegisterSensorState.failed(Failure failure) = _Failed;
}

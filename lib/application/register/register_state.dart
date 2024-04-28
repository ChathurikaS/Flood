part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.loading() = _Loading;
  const factory RegisterState.succeed({required User user}) = _Succeed;
  const factory RegisterState.failed({required Failure failure}) = _Failed;
}

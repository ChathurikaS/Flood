part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.succeed({required User user}) = _Succeed;
  const factory LoginState.failed({required Failure failure}) = _Failed;
}

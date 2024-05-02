part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.user({required User user}) = _User;
  const factory LoginState.admin({required Admin admin}) = _Admin;
  const factory LoginState.failed({required Failure failure}) = _Failed;
}

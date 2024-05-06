part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.user({required User user, required City city}) =
      _User;
  const factory AuthState.admin({required Admin admin, City? city}) = _Admin;
  const factory AuthState.failed(Failure failure) = _Failed;
}

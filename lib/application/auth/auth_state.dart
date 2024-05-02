part of 'auth_cubit.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    required bool isLoading,
    required Option<User> user,
    required Option<Admin> admin,
    required Option<City> city,
    required Option<Failure> failure,
  }) = _AuthState;
}

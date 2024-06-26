part of 'update_user_cubit.dart';

@freezed
class UpdateUserState with _$UpdateUserState {
  const factory UpdateUserState.initial() = _Initial;
  const factory UpdateUserState.loading() = _Loading;
  const factory UpdateUserState.succeed({required User user}) = _Succeed;
  const factory UpdateUserState.failed({required Failure failure}) = _Failed;
}

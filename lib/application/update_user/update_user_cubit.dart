import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_application_1/domain/failure/failure.dart';
import 'package:flutter_application_1/domain/user/i_user_repo.dart';
import 'package:flutter_application_1/domain/user/user.dart';

part 'update_user_state.dart';
part 'update_user_cubit.freezed.dart';

@injectable
class UpdateUserCubit extends Cubit<UpdateUserState> {
  final IUserRepo _userRepo;
  UpdateUserCubit(
    this._userRepo,
  ) : super(const UpdateUserState.initial());

  Future<void> update(User user) async {
    emit(const UpdateUserState.loading());
    final result = await _userRepo.update(user);
    result.fold(
      (failure) => emit(UpdateUserState.failed(failure: failure)),
      (user) => emit(UpdateUserState.succeed(user: user)),
    );
  }
}

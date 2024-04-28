import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_application_1/core/extensions/dartz_x.dart';
import 'package:flutter_application_1/domain/auth/i_auth_facade.dart';
import 'package:flutter_application_1/domain/failure/failure.dart';
import 'package:flutter_application_1/domain/user/i_user_repo.dart';
import 'package:flutter_application_1/domain/user/user.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final IAuthFacade _authFacade;
  final IUserRepo _userRepo;

  LoginCubit(
    this._authFacade,
    this._userRepo,
  ) : super(const LoginState.initial());

  Future<void> login(String email, String password) async {
    emit(const LoginState.loading());
    if (email.isEmpty) {
      emit(const LoginState.failed(
          failure: Failure(message: "Email is required")));
      return;
    }

    if (password.isEmpty) {
      emit(const LoginState.failed(
          failure: Failure(message: "Password is required")));
      return;
    }

    final failureOrUid = await _authFacade.signInWithEmailAndPassword(
        email: email, password: password);

    if (failureOrUid.isLeft()) {
      emit(LoginState.failed(failure: failureOrUid.getLeft()));
      return;
    }

    final failureOrUser = await _userRepo.getCurrent();

    if (failureOrUser.isLeft()) {
      emit(LoginState.failed(failure: failureOrUser.getLeft()));
      return;
    }

    emit(LoginState.succeed(user: failureOrUser.getOrCrash()));
  }
}

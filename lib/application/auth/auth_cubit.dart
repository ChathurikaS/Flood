import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_application_1/core/extensions/dartz_x.dart';
import 'package:flutter_application_1/domain/auth/i_auth_facade.dart';
import 'package:flutter_application_1/domain/failure/failure.dart';
import 'package:flutter_application_1/domain/user/i_user_repo.dart';
import 'package:flutter_application_1/domain/user/user.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final IAuthFacade _authFacade;
  final IUserRepo _userRepo;

  AuthCubit(
    this._authFacade,
    this._userRepo,
  ) : super(const AuthState(isLoading: false, user: None(), failure: None()));

  Future<void> watch() async {
    _authFacade.watchAuthState().listen((isSignedIn) async {
      emit(state.copyWith(isLoading: true, failure: const None()));
      if (!isSignedIn) {
        await Future.delayed(const Duration(seconds: 2));
        emit(state.copyWith(isLoading: false, user: const None()));
      }
      if (isSignedIn) {
        final userOption = await _userRepo.getCurrent();

        if (userOption.isLeft()) {
          emit(state.copyWith(
              isLoading: false, failure: Some(userOption.getLeft())));
          return;
        }

        emit(state.copyWith(
            isLoading: false, user: Some(userOption.getOrCrash())));

        _userRepo.watchCurrent().listen((user) {
          emit(state.copyWith(user: Some(user)));
        });
      }
    });
  }

  Future<void> signOut() async {
    emit(state.copyWith(isLoading: true, failure: const None()));
    await _authFacade.signOut();
  }

  void tempUser(User user) {
    emit(state.copyWith(user: Some(user)));
  }
}

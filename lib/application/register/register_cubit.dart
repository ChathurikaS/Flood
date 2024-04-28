// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_application_1/core/extensions/dartz_x.dart';

import 'package:flutter_application_1/domain/failure/failure.dart';
import 'package:flutter_application_1/domain/user/i_user_repo.dart';
import 'package:flutter_application_1/domain/user/user.dart';

part 'register_cubit.freezed.dart';
part 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final IUserRepo _userRepo;
  RegisterCubit(
    this._userRepo,
  ) : super(const RegisterState.initial());

  Future<void> register(
      {required User user,
      required String password,
      required String confirmPassword}) async {
    emit(const RegisterState.loading());
    await Future.delayed(const Duration(seconds: 3));

    final userValidation = user.validateCreate();
    if (userValidation.isLeft()) {
      emit(RegisterState.failed(failure: userValidation.getLeft()));
      return;
    }

    if (password.length < 6) {
      emit(const RegisterState.failed(
          failure: Failure(message: 'Password must be at least 6 characters')));
      return;
    }

    if (password != confirmPassword) {
      emit(const RegisterState.failed(
          failure: Failure(message: 'Passwords do not match')));
      return;
    }

    final failureOrUser = await _userRepo.register(user, password);

    if (failureOrUser.isLeft()) {
      emit(RegisterState.failed(failure: failureOrUser.getLeft()));
      return;
    }

    emit(RegisterState.succeed(user: failureOrUser.getOrCrash()));
  }
}

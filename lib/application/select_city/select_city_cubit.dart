import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_application_1/core/extensions/dartz_x.dart';
import 'package:flutter_application_1/domain/failure/failure.dart';
import 'package:flutter_application_1/domain/user/i_user_repo.dart';
import 'package:flutter_application_1/domain/user/user.dart';

part 'select_city_state.dart';
part 'select_city_cubit.freezed.dart';

@injectable
class SelectCityCubit extends Cubit<SelectCityState> {
  final IUserRepo _userRepo;
  SelectCityCubit(
    this._userRepo,
  ) : super(const SelectCityState.initial());

  Future<void> updateCityWithUser(User user) async {
    emit(const SelectCityState.loading());
    final failureOrUser = await _userRepo.update(user);
    if (failureOrUser.isLeft()) {
      emit(SelectCityState.failed(failureOrUser.getLeft()));
      return;
    }
    emit(const SelectCityState.succeed());
  }
}

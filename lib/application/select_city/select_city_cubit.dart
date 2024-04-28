import 'dart:async';

import 'package:dartz/dartz.dart';
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
  ) : super(
          const SelectCityState(
            cities: _cities,
            cityUpdateState: CityUpdateState.init,
            failure: None(),
          ),
        );

  Future<void> updateCityWithUser(User user) async {
    emit(state.copyWith(cityUpdateState: CityUpdateState.loading));
    final failureOrUser = await _userRepo.update(user);
    if (failureOrUser.isLeft()) {
      emit(
        state.copyWith(
          cityUpdateState: CityUpdateState.failed,
          failure: Some(failureOrUser.getLeft()),
        ),
      );
      return;
    }
    emit(state.copyWith(
      cityUpdateState: CityUpdateState.success,
      failure: const None(),
    ));
  }

  static const _cities = [
    "Ampara",
    "Anuradhapura",
    "Badulla",
    "Batticaloa",
    "Colombo",
    "Galle",
    "Gampaha",
    "Hambantota",
    "Jaffna",
    "Kalutara",
    "Kandy",
    "Kegalle",
    "Kilinochchi",
    "Kurunegala",
    "Mannar",
    "Matale",
    "Matara",
    "Monaragala",
    "Mullaitivu",
    "Nuwara Eliya",
    "Polonnaruwa",
    "Puttalam",
    "Ratnapura",
    "Trincomalee",
    "Vavuniya"
  ];
}

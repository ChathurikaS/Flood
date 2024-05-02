import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/domain/admin/admin.dart';
import 'package:flutter_application_1/domain/city/city.dart';
import 'package:flutter_application_1/domain/city/i_city_repo.dart';
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
  final ICityRepo _cityRepo;

  AuthCubit(this._authFacade, this._userRepo, this._cityRepo)
      : super(const AuthState(
            isLoading: false,
            user: None(),
            admin: None(),
            city: None(),
            failure: None()));

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

        final failureOrCity = await _cityRepo.get(userOption.getOrCrash().city);

        if (failureOrCity.isLeft()) {
          emit(state.copyWith(
              isLoading: false, failure: Some(failureOrCity.getLeft())));
          return;
        }

        emit(state.copyWith(
            isLoading: false,
            user: Some(userOption.getOrCrash()),
            city: Some(failureOrCity.getOrCrash())));

        _userRepo.watchCurrent().listen((user) {
          emit(state.copyWith(user: Some(user)));
        });
      }
    });
  }

  Future<void> setAdmin(Admin admin) async {
    emit(state.copyWith(isLoading: true, failure: const None()));
    final failureOrCities = await _cityRepo.getAll();
    log(failureOrCities.toString());

    if (failureOrCities.isLeft()) {
      emit(state.copyWith(
          isLoading: false, failure: Some(failureOrCities.getLeft())));
      return;
    }
    final cities = failureOrCities.getOrCrash();
    if (cities.isEmpty) {
      emit(state.copyWith(isLoading: false, admin: Some(admin)));
      return;
    }
    emit(state.copyWith(
        isLoading: false, admin: Some(admin), city: Some(cities.first)));
  }

  Future<void> signOut() async {
    emit(state.copyWith(isLoading: true, failure: const None()));
    await _authFacade.signOut();
    emit(state.copyWith(isLoading: false));
  }

  void signOutAdmin() {
    emit(state.copyWith(admin: const None(), city: const None()));
  }

  void changeCity(City city) {
    emit(state.copyWith(city: Some(city)));
  }
}

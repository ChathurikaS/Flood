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
      : super(const AuthState.loading());

  Future<void> watch() async {
    _authFacade.watchAuthState().listen((isSignedIn) async {
      emit(const AuthState.loading());
      if (!isSignedIn) {
        await Future.delayed(const Duration(seconds: 2));
        emit(const AuthState.unauthenticated());
        return;
      }
      final failureOrUser = await _userRepo.getCurrent();

      if (failureOrUser.isLeft()) {
        emit(AuthState.failed(failureOrUser.getLeft()));
        return;
      }

      final failureOrCity =
          await _getCityForUser(failureOrUser.getOrCrash().city);

      if (failureOrCity.isLeft()) {
        emit(AuthState.failed(failureOrCity.getLeft()));
        return;
      }

      emit(AuthState.user(
          user: failureOrUser.getOrCrash(), city: failureOrCity.getOrCrash()));

      _userRepo.watchCurrent().listen((user) {
        emit(AuthState.user(user: user, city: failureOrCity.getOrCrash()));
      });
    });
  }

  Future<void> setAdmin(Admin admin) async {
    emit(const AuthState.loading());
    final failureOrCities = await _cityRepo.getAll();

    if (failureOrCities.isLeft()) {
      emit(AuthState.failed(failureOrCities.getLeft()));
      return;
    }
    final cities = failureOrCities.getOrCrash();
    if (cities.isEmpty) {
      emit(AuthState.admin(admin: admin));
      return;
    }
    emit(AuthState.admin(admin: admin, city: cities.first));
  }

  Future<void> signOutUser() async {
    emit(const AuthState.loading());
    await _authFacade.signOut();
    emit(const AuthState.unauthenticated());
  }

  void signOutAdmin() {
    emit(const AuthState.unauthenticated());
  }

  void changeCity(City city) {
    state.maybeWhen(
        admin: (admin, _) {
          emit(AuthState.admin(admin: admin, city: city));
        },
        user: (user, _) {
          emit(AuthState.user(user: user, city: city));
        },
        orElse: () {});
  }

  Future<Either<Failure, City>> _getCityForUser(String cityId) async {
    if (cityId.isEmpty) {
      final failureOrCities = await _cityRepo.getAll();
      if (failureOrCities.isLeft()) {
        return Left(failureOrCities.getLeft());
      }
      final cities = failureOrCities.getOrCrash();
      if (cities.isEmpty) {
        return const Left(Failure(message: "No cities found"));
      }
      return Right(cities.first);
    }
    final failureOrCity = await _cityRepo.get(cityId);
    if (failureOrCity.isLeft()) {
      return Left(failureOrCity.getLeft());
    }
    return Right(failureOrCity.getOrCrash());
  }
}

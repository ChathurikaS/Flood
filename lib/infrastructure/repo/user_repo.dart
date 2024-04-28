import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_application_1/core/extensions/dartz_x.dart';
import 'package:flutter_application_1/domain/failure/failure.dart';
import 'package:flutter_application_1/domain/user/i_user_repo.dart';
import 'package:flutter_application_1/domain/user/user.dart';
import 'package:flutter_application_1/infrastructure/services/auth_service.dart';
import 'package:flutter_application_1/infrastructure/services/user_service.dart';

@LazySingleton(as: IUserRepo)
class UserRepo implements IUserRepo {
  final AuthService _authService;
  final UserService _userService;

  UserRepo(this._authService, this._userService);

  @override
  Future<Either<Failure, User>> getCurrent() async =>
      _userService.getCurrent(uid: _authService.uid);

  @override
  Future<Either<Failure, User>> update(User user) async =>
      _userService.update(user: user);

  @override
  Stream<User> watchCurrent() =>
      _userService.watchCurrent(uid: _authService.uid);

  @override
  Future<Either<Failure, User>> register(User user, String password) async {
    final failureOrUid =
        await _authService.registerWithEmailAndPassword(user.email, password);

    if (failureOrUid.isLeft()) {
      return left(failureOrUid.getLeft());
    }

    final registeredUser = user.copyWith(uid: failureOrUid.getOrCrash());

    final failureOrUser = await _userService.update(user: registeredUser);

    if (failureOrUser.isLeft()) {
      return left(failureOrUser.getLeft());
    }

    return right(failureOrUser.getOrCrash());
  }
}

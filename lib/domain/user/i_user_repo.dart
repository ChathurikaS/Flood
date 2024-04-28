import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/domain/failure/failure.dart';
import 'package:flutter_application_1/domain/user/user.dart';

abstract class IUserRepo {
  Future<Either<Failure, User>> getCurrent();
  Stream<User> watchCurrent();
  Future<Either<Failure, User>> register(User user, String password);
  Future<Either<Failure, User>> update(User user);
}

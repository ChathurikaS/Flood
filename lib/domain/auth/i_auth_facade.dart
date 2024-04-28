import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/domain/failure/failure.dart';

abstract class IAuthFacade {
  bool get isSignedIn;
  String get uid;
  String get email;
  Stream<bool> watchAuthState();
  Future<Either<Failure, String>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<Failure, String>> registerEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> signOut();
}

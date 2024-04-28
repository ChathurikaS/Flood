import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_application_1/domain/auth/i_auth_facade.dart';
import 'package:flutter_application_1/domain/failure/failure.dart';
import 'package:flutter_application_1/infrastructure/services/auth_service.dart';

@LazySingleton(as: IAuthFacade)
class AuthRepo implements IAuthFacade {
  final AuthService _service;

  AuthRepo(this._service);

  @override
  Stream<bool> watchAuthState() => _service.watchAuthState();

  @override
  bool get isSignedIn => _service.isSignedIn;

  @override
  String get uid => _service.uid;

  @override
  String get email => _service.email;

  @override
  Future<Either<Failure, String>> registerEmailAndPassword(
          {required String email, required String password}) async =>
      _service.registerWithEmailAndPassword(email, password);

  @override
  Future<Either<Failure, String>> signInWithEmailAndPassword(
          {required String email, required String password}) async =>
      _service.signInWithEmailAndPassword(email, password);

  @override
  Future<void> signOut() async => _service.signOut();
}

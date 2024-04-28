import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_application_1/domain/failure/failure.dart';

@lazySingleton
class AuthService {
  final FirebaseAuth _auth;
  AuthService(this._auth);

  Stream<bool> watchAuthState() async* {
    yield* _auth.authStateChanges().map((user) => user != null);
  }

  bool get isSignedIn => _auth.currentUser != null;

  String get uid {
    final user = _auth.currentUser;
    if (user != null) {
      return user.uid;
    } else {
      throw const Failure(message: "User not found");
    }
  }

  String get email {
    final user = _auth.currentUser;
    if (user != null) {
      return user.email ?? "";
    } else {
      throw const Failure(message: "User not found");
    }
  }

  Future<Either<Failure, String>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = cred.user;
      if (user != null) {
        return right(user.uid);
      } else {
        return left(const Failure(message: "Account not found"));
      }
    } on FirebaseAuthException catch (e) {
      return left(
          Failure(message: e.message ?? "An error occurred while signing in"));
    } catch (e) {
      return left(const Failure(message: "An error occurred while signing in"));
    }
  }

  Future<Either<Failure, String>> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = cred.user;
      if (user != null) {
        return right(user.uid);
      } else {
        return left(const Failure(message: "Account not found"));
      }
    } on FirebaseAuthException catch (e) {
      return left(Failure(
          message: e.message ?? "An error occurred while creating account"));
    } catch (e) {
      return left(
          const Failure(message: "An error occurred while creating account"));
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

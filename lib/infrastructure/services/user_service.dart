import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_application_1/domain/failure/failure.dart';
import 'package:flutter_application_1/domain/user/user.dart';

@lazySingleton
class UserService {
  final FirebaseFirestore _db;

  UserService(this._db);

  CollectionReference get _usersRef => _db.collection('users');

  Future<Either<Failure, User>> getCurrent({required String uid}) async {
    try {
      final doc = await _usersRef.doc(uid).get();
      if (doc.exists) {
        return right(User.fromJson(doc.data() as Map<String, dynamic>));
      } else {
        return left(const Failure(message: "Account not found"));
      }
    } on FirebaseException catch (e) {
      return left(Failure(
          message: e.message ?? "An error occurred while fetching user data"));
    } catch (e) {
      return left(
          const Failure(message: "An error occurred while fetching user data"));
    }
  }

  Future<Either<Failure, User>> update({required User user}) async {
    try {
      await _usersRef.doc(user.uid).set(user.toJson());
      return right(user);
    } on FirebaseException catch (e) {
      return left(Failure(
          message: e.message ?? "An error occurred while creating user data"));
    } catch (e) {
      return left(
          const Failure(message: "An error occurred while creating user data"));
    }
  }

  Stream<User> watchCurrent({required String uid}) async* {
    yield* _usersRef.doc(uid).snapshots().map((doc) {
      return User.fromJson(doc.data() as Map<String, dynamic>);
    });
  }
}

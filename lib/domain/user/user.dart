import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_application_1/domain/failure/failure.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const User._();
  const factory User({
    required String uid,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String nic,
    required String city,
  }) = _User;
  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  factory User.empty() => const User(
        uid: '',
        firstName: '',
        lastName: '',
        email: '',
        phone: '',
        nic: '',
        city: '',
      );

  factory User.placeholder() => const User(
        email: "(Email Address)",
        firstName: "(First Name)",
        lastName: "(Last Name)",
        nic: "(NIC)",
        phone: "(Phone Number)",
        uid: "(UID)",
        city: "(City)",
      );

  Either<Failure, User> validateCreate() {
    if (firstName.isEmpty) {
      return left(const Failure(message: 'First Name is required'));
    }
    if (lastName.isEmpty) {
      return left(const Failure(message: 'Last Name is required'));
    }
    if (email.isEmpty) {
      return left(const Failure(message: 'Email is required'));
    }
    return right(this);
  }
}

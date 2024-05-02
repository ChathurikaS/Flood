import 'package:freezed_annotation/freezed_annotation.dart';
part 'admin.freezed.dart';

@freezed
abstract class Admin with _$Admin {
  const factory Admin({
    required String email,
    required String city,
  }) = _Admin;

  factory Admin.empty() => const Admin(email: "", city: "");
}

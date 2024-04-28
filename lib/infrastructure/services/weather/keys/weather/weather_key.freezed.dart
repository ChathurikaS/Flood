// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_key.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeatherKey _$WeatherKeyFromJson(Map<String, dynamic> json) {
  return _WeatherKey.fromJson(json);
}

/// @nodoc
mixin _$WeatherKey {
  int get id => throw _privateConstructorUsedError;
  String get main => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherKeyCopyWith<WeatherKey> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherKeyCopyWith<$Res> {
  factory $WeatherKeyCopyWith(
          WeatherKey value, $Res Function(WeatherKey) then) =
      _$WeatherKeyCopyWithImpl<$Res, WeatherKey>;
  @useResult
  $Res call({int id, String main, String description, String icon});
}

/// @nodoc
class _$WeatherKeyCopyWithImpl<$Res, $Val extends WeatherKey>
    implements $WeatherKeyCopyWith<$Res> {
  _$WeatherKeyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? main = null,
    Object? description = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      main: null == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherKeyImplCopyWith<$Res>
    implements $WeatherKeyCopyWith<$Res> {
  factory _$$WeatherKeyImplCopyWith(
          _$WeatherKeyImpl value, $Res Function(_$WeatherKeyImpl) then) =
      __$$WeatherKeyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String main, String description, String icon});
}

/// @nodoc
class __$$WeatherKeyImplCopyWithImpl<$Res>
    extends _$WeatherKeyCopyWithImpl<$Res, _$WeatherKeyImpl>
    implements _$$WeatherKeyImplCopyWith<$Res> {
  __$$WeatherKeyImplCopyWithImpl(
      _$WeatherKeyImpl _value, $Res Function(_$WeatherKeyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? main = null,
    Object? description = null,
    Object? icon = null,
  }) {
    return _then(_$WeatherKeyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      main: null == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherKeyImpl implements _WeatherKey {
  const _$WeatherKeyImpl(
      {required this.id,
      required this.main,
      required this.description,
      required this.icon});

  factory _$WeatherKeyImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherKeyImplFromJson(json);

  @override
  final int id;
  @override
  final String main;
  @override
  final String description;
  @override
  final String icon;

  @override
  String toString() {
    return 'WeatherKey(id: $id, main: $main, description: $description, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherKeyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.main, main) || other.main == main) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, main, description, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherKeyImplCopyWith<_$WeatherKeyImpl> get copyWith =>
      __$$WeatherKeyImplCopyWithImpl<_$WeatherKeyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherKeyImplToJson(
      this,
    );
  }
}

abstract class _WeatherKey implements WeatherKey {
  const factory _WeatherKey(
      {required final int id,
      required final String main,
      required final String description,
      required final String icon}) = _$WeatherKeyImpl;

  factory _WeatherKey.fromJson(Map<String, dynamic> json) =
      _$WeatherKeyImpl.fromJson;

  @override
  int get id;
  @override
  String get main;
  @override
  String get description;
  @override
  String get icon;
  @override
  @JsonKey(ignore: true)
  _$$WeatherKeyImplCopyWith<_$WeatherKeyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

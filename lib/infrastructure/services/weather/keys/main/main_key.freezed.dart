// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_key.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MainKey _$MainKeyFromJson(Map<String, dynamic> json) {
  return _MainKey.fromJson(json);
}

/// @nodoc
mixin _$MainKey {
  double get temp => throw _privateConstructorUsedError;
  @JsonKey(name: "feels_like")
  double get feelsLike => throw _privateConstructorUsedError;
  @JsonKey(name: "temp_min")
  double get tempMin => throw _privateConstructorUsedError;
  @JsonKey(name: "temp_max")
  double get tempMax => throw _privateConstructorUsedError;
  int get pressure => throw _privateConstructorUsedError;
  int get humidity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MainKeyCopyWith<MainKey> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainKeyCopyWith<$Res> {
  factory $MainKeyCopyWith(MainKey value, $Res Function(MainKey) then) =
      _$MainKeyCopyWithImpl<$Res, MainKey>;
  @useResult
  $Res call(
      {double temp,
      @JsonKey(name: "feels_like") double feelsLike,
      @JsonKey(name: "temp_min") double tempMin,
      @JsonKey(name: "temp_max") double tempMax,
      int pressure,
      int humidity});
}

/// @nodoc
class _$MainKeyCopyWithImpl<$Res, $Val extends MainKey>
    implements $MainKeyCopyWith<$Res> {
  _$MainKeyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = null,
    Object? feelsLike = null,
    Object? tempMin = null,
    Object? tempMax = null,
    Object? pressure = null,
    Object? humidity = null,
  }) {
    return _then(_value.copyWith(
      temp: null == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as double,
      feelsLike: null == feelsLike
          ? _value.feelsLike
          : feelsLike // ignore: cast_nullable_to_non_nullable
              as double,
      tempMin: null == tempMin
          ? _value.tempMin
          : tempMin // ignore: cast_nullable_to_non_nullable
              as double,
      tempMax: null == tempMax
          ? _value.tempMax
          : tempMax // ignore: cast_nullable_to_non_nullable
              as double,
      pressure: null == pressure
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as int,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainKeyImplCopyWith<$Res> implements $MainKeyCopyWith<$Res> {
  factory _$$MainKeyImplCopyWith(
          _$MainKeyImpl value, $Res Function(_$MainKeyImpl) then) =
      __$$MainKeyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double temp,
      @JsonKey(name: "feels_like") double feelsLike,
      @JsonKey(name: "temp_min") double tempMin,
      @JsonKey(name: "temp_max") double tempMax,
      int pressure,
      int humidity});
}

/// @nodoc
class __$$MainKeyImplCopyWithImpl<$Res>
    extends _$MainKeyCopyWithImpl<$Res, _$MainKeyImpl>
    implements _$$MainKeyImplCopyWith<$Res> {
  __$$MainKeyImplCopyWithImpl(
      _$MainKeyImpl _value, $Res Function(_$MainKeyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = null,
    Object? feelsLike = null,
    Object? tempMin = null,
    Object? tempMax = null,
    Object? pressure = null,
    Object? humidity = null,
  }) {
    return _then(_$MainKeyImpl(
      temp: null == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as double,
      feelsLike: null == feelsLike
          ? _value.feelsLike
          : feelsLike // ignore: cast_nullable_to_non_nullable
              as double,
      tempMin: null == tempMin
          ? _value.tempMin
          : tempMin // ignore: cast_nullable_to_non_nullable
              as double,
      tempMax: null == tempMax
          ? _value.tempMax
          : tempMax // ignore: cast_nullable_to_non_nullable
              as double,
      pressure: null == pressure
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as int,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MainKeyImpl implements _MainKey {
  const _$MainKeyImpl(
      {required this.temp,
      @JsonKey(name: "feels_like") required this.feelsLike,
      @JsonKey(name: "temp_min") required this.tempMin,
      @JsonKey(name: "temp_max") required this.tempMax,
      required this.pressure,
      required this.humidity});

  factory _$MainKeyImpl.fromJson(Map<String, dynamic> json) =>
      _$$MainKeyImplFromJson(json);

  @override
  final double temp;
  @override
  @JsonKey(name: "feels_like")
  final double feelsLike;
  @override
  @JsonKey(name: "temp_min")
  final double tempMin;
  @override
  @JsonKey(name: "temp_max")
  final double tempMax;
  @override
  final int pressure;
  @override
  final int humidity;

  @override
  String toString() {
    return 'MainKey(temp: $temp, feelsLike: $feelsLike, tempMin: $tempMin, tempMax: $tempMax, pressure: $pressure, humidity: $humidity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainKeyImpl &&
            (identical(other.temp, temp) || other.temp == temp) &&
            (identical(other.feelsLike, feelsLike) ||
                other.feelsLike == feelsLike) &&
            (identical(other.tempMin, tempMin) || other.tempMin == tempMin) &&
            (identical(other.tempMax, tempMax) || other.tempMax == tempMax) &&
            (identical(other.pressure, pressure) ||
                other.pressure == pressure) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, temp, feelsLike, tempMin, tempMax, pressure, humidity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainKeyImplCopyWith<_$MainKeyImpl> get copyWith =>
      __$$MainKeyImplCopyWithImpl<_$MainKeyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MainKeyImplToJson(
      this,
    );
  }
}

abstract class _MainKey implements MainKey {
  const factory _MainKey(
      {required final double temp,
      @JsonKey(name: "feels_like") required final double feelsLike,
      @JsonKey(name: "temp_min") required final double tempMin,
      @JsonKey(name: "temp_max") required final double tempMax,
      required final int pressure,
      required final int humidity}) = _$MainKeyImpl;

  factory _MainKey.fromJson(Map<String, dynamic> json) = _$MainKeyImpl.fromJson;

  @override
  double get temp;
  @override
  @JsonKey(name: "feels_like")
  double get feelsLike;
  @override
  @JsonKey(name: "temp_min")
  double get tempMin;
  @override
  @JsonKey(name: "temp_max")
  double get tempMax;
  @override
  int get pressure;
  @override
  int get humidity;
  @override
  @JsonKey(ignore: true)
  _$$MainKeyImplCopyWith<_$MainKeyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

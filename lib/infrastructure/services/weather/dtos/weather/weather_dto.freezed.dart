// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeatherDto _$WeatherDtoFromJson(Map<String, dynamic> json) {
  return _WeatherDto.fromJson(json);
}

/// @nodoc
mixin _$WeatherDto {
  List<WeatherKey> get weather => throw _privateConstructorUsedError;
  MainKey get main => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherDtoCopyWith<WeatherDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherDtoCopyWith<$Res> {
  factory $WeatherDtoCopyWith(
          WeatherDto value, $Res Function(WeatherDto) then) =
      _$WeatherDtoCopyWithImpl<$Res, WeatherDto>;
  @useResult
  $Res call({List<WeatherKey> weather, MainKey main});

  $MainKeyCopyWith<$Res> get main;
}

/// @nodoc
class _$WeatherDtoCopyWithImpl<$Res, $Val extends WeatherDto>
    implements $WeatherDtoCopyWith<$Res> {
  _$WeatherDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weather = null,
    Object? main = null,
  }) {
    return _then(_value.copyWith(
      weather: null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<WeatherKey>,
      main: null == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as MainKey,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MainKeyCopyWith<$Res> get main {
    return $MainKeyCopyWith<$Res>(_value.main, (value) {
      return _then(_value.copyWith(main: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherDtoImplCopyWith<$Res>
    implements $WeatherDtoCopyWith<$Res> {
  factory _$$WeatherDtoImplCopyWith(
          _$WeatherDtoImpl value, $Res Function(_$WeatherDtoImpl) then) =
      __$$WeatherDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<WeatherKey> weather, MainKey main});

  @override
  $MainKeyCopyWith<$Res> get main;
}

/// @nodoc
class __$$WeatherDtoImplCopyWithImpl<$Res>
    extends _$WeatherDtoCopyWithImpl<$Res, _$WeatherDtoImpl>
    implements _$$WeatherDtoImplCopyWith<$Res> {
  __$$WeatherDtoImplCopyWithImpl(
      _$WeatherDtoImpl _value, $Res Function(_$WeatherDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weather = null,
    Object? main = null,
  }) {
    return _then(_$WeatherDtoImpl(
      weather: null == weather
          ? _value._weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<WeatherKey>,
      main: null == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as MainKey,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherDtoImpl extends _WeatherDto {
  const _$WeatherDtoImpl(
      {required final List<WeatherKey> weather, required this.main})
      : _weather = weather,
        super._();

  factory _$WeatherDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherDtoImplFromJson(json);

  final List<WeatherKey> _weather;
  @override
  List<WeatherKey> get weather {
    if (_weather is EqualUnmodifiableListView) return _weather;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weather);
  }

  @override
  final MainKey main;

  @override
  String toString() {
    return 'WeatherDto(weather: $weather, main: $main)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherDtoImpl &&
            const DeepCollectionEquality().equals(other._weather, _weather) &&
            (identical(other.main, main) || other.main == main));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_weather), main);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherDtoImplCopyWith<_$WeatherDtoImpl> get copyWith =>
      __$$WeatherDtoImplCopyWithImpl<_$WeatherDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherDtoImplToJson(
      this,
    );
  }
}

abstract class _WeatherDto extends WeatherDto {
  const factory _WeatherDto(
      {required final List<WeatherKey> weather,
      required final MainKey main}) = _$WeatherDtoImpl;
  const _WeatherDto._() : super._();

  factory _WeatherDto.fromJson(Map<String, dynamic> json) =
      _$WeatherDtoImpl.fromJson;

  @override
  List<WeatherKey> get weather;
  @override
  MainKey get main;
  @override
  @JsonKey(ignore: true)
  _$$WeatherDtoImplCopyWith<_$WeatherDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

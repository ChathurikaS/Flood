// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forecast_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ForecastDto _$ForecastDtoFromJson(Map<String, dynamic> json) {
  return _ForecastDto.fromJson(json);
}

/// @nodoc
mixin _$ForecastDto {
  @JsonKey(name: "dt")
  int get date => throw _privateConstructorUsedError;
  List<WeatherKey> get weather => throw _privateConstructorUsedError;
  MainKey get main => throw _privateConstructorUsedError;
  @JsonKey(name: "dt_txt")
  String get dtText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForecastDtoCopyWith<ForecastDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastDtoCopyWith<$Res> {
  factory $ForecastDtoCopyWith(
          ForecastDto value, $Res Function(ForecastDto) then) =
      _$ForecastDtoCopyWithImpl<$Res, ForecastDto>;
  @useResult
  $Res call(
      {@JsonKey(name: "dt") int date,
      List<WeatherKey> weather,
      MainKey main,
      @JsonKey(name: "dt_txt") String dtText});

  $MainKeyCopyWith<$Res> get main;
}

/// @nodoc
class _$ForecastDtoCopyWithImpl<$Res, $Val extends ForecastDto>
    implements $ForecastDtoCopyWith<$Res> {
  _$ForecastDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? weather = null,
    Object? main = null,
    Object? dtText = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      weather: null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<WeatherKey>,
      main: null == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as MainKey,
      dtText: null == dtText
          ? _value.dtText
          : dtText // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$ForecastDtoImplCopyWith<$Res>
    implements $ForecastDtoCopyWith<$Res> {
  factory _$$ForecastDtoImplCopyWith(
          _$ForecastDtoImpl value, $Res Function(_$ForecastDtoImpl) then) =
      __$$ForecastDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "dt") int date,
      List<WeatherKey> weather,
      MainKey main,
      @JsonKey(name: "dt_txt") String dtText});

  @override
  $MainKeyCopyWith<$Res> get main;
}

/// @nodoc
class __$$ForecastDtoImplCopyWithImpl<$Res>
    extends _$ForecastDtoCopyWithImpl<$Res, _$ForecastDtoImpl>
    implements _$$ForecastDtoImplCopyWith<$Res> {
  __$$ForecastDtoImplCopyWithImpl(
      _$ForecastDtoImpl _value, $Res Function(_$ForecastDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? weather = null,
    Object? main = null,
    Object? dtText = null,
  }) {
    return _then(_$ForecastDtoImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      weather: null == weather
          ? _value._weather
          : weather // ignore: cast_nullable_to_non_nullable
              as List<WeatherKey>,
      main: null == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as MainKey,
      dtText: null == dtText
          ? _value.dtText
          : dtText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ForecastDtoImpl extends _ForecastDto {
  const _$ForecastDtoImpl(
      {@JsonKey(name: "dt") required this.date,
      required final List<WeatherKey> weather,
      required this.main,
      @JsonKey(name: "dt_txt") required this.dtText})
      : _weather = weather,
        super._();

  factory _$ForecastDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForecastDtoImplFromJson(json);

  @override
  @JsonKey(name: "dt")
  final int date;
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
  @JsonKey(name: "dt_txt")
  final String dtText;

  @override
  String toString() {
    return 'ForecastDto(date: $date, weather: $weather, main: $main, dtText: $dtText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForecastDtoImpl &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._weather, _weather) &&
            (identical(other.main, main) || other.main == main) &&
            (identical(other.dtText, dtText) || other.dtText == dtText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date,
      const DeepCollectionEquality().hash(_weather), main, dtText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForecastDtoImplCopyWith<_$ForecastDtoImpl> get copyWith =>
      __$$ForecastDtoImplCopyWithImpl<_$ForecastDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForecastDtoImplToJson(
      this,
    );
  }
}

abstract class _ForecastDto extends ForecastDto {
  const factory _ForecastDto(
          {@JsonKey(name: "dt") required final int date,
          required final List<WeatherKey> weather,
          required final MainKey main,
          @JsonKey(name: "dt_txt") required final String dtText}) =
      _$ForecastDtoImpl;
  const _ForecastDto._() : super._();

  factory _ForecastDto.fromJson(Map<String, dynamic> json) =
      _$ForecastDtoImpl.fromJson;

  @override
  @JsonKey(name: "dt")
  int get date;
  @override
  List<WeatherKey> get weather;
  @override
  MainKey get main;
  @override
  @JsonKey(name: "dt_txt")
  String get dtText;
  @override
  @JsonKey(ignore: true)
  _$$ForecastDtoImplCopyWith<_$ForecastDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

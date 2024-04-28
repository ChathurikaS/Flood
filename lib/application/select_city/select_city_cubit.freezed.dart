// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_city_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SelectCityState {
  List<String> get cities => throw _privateConstructorUsedError;
  CityUpdateState get cityUpdateState => throw _privateConstructorUsedError;
  Option<Failure> get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectCityStateCopyWith<SelectCityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectCityStateCopyWith<$Res> {
  factory $SelectCityStateCopyWith(
          SelectCityState value, $Res Function(SelectCityState) then) =
      _$SelectCityStateCopyWithImpl<$Res, SelectCityState>;
  @useResult
  $Res call(
      {List<String> cities,
      CityUpdateState cityUpdateState,
      Option<Failure> failure});
}

/// @nodoc
class _$SelectCityStateCopyWithImpl<$Res, $Val extends SelectCityState>
    implements $SelectCityStateCopyWith<$Res> {
  _$SelectCityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cities = null,
    Object? cityUpdateState = null,
    Object? failure = null,
  }) {
    return _then(_value.copyWith(
      cities: null == cities
          ? _value.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cityUpdateState: null == cityUpdateState
          ? _value.cityUpdateState
          : cityUpdateState // ignore: cast_nullable_to_non_nullable
              as CityUpdateState,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectCityImplCopyWith<$Res>
    implements $SelectCityStateCopyWith<$Res> {
  factory _$$SelectCityImplCopyWith(
          _$SelectCityImpl value, $Res Function(_$SelectCityImpl) then) =
      __$$SelectCityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> cities,
      CityUpdateState cityUpdateState,
      Option<Failure> failure});
}

/// @nodoc
class __$$SelectCityImplCopyWithImpl<$Res>
    extends _$SelectCityStateCopyWithImpl<$Res, _$SelectCityImpl>
    implements _$$SelectCityImplCopyWith<$Res> {
  __$$SelectCityImplCopyWithImpl(
      _$SelectCityImpl _value, $Res Function(_$SelectCityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cities = null,
    Object? cityUpdateState = null,
    Object? failure = null,
  }) {
    return _then(_$SelectCityImpl(
      cities: null == cities
          ? _value._cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cityUpdateState: null == cityUpdateState
          ? _value.cityUpdateState
          : cityUpdateState // ignore: cast_nullable_to_non_nullable
              as CityUpdateState,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
    ));
  }
}

/// @nodoc

class _$SelectCityImpl implements _SelectCity {
  const _$SelectCityImpl(
      {required final List<String> cities,
      required this.cityUpdateState,
      required this.failure})
      : _cities = cities;

  final List<String> _cities;
  @override
  List<String> get cities {
    if (_cities is EqualUnmodifiableListView) return _cities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cities);
  }

  @override
  final CityUpdateState cityUpdateState;
  @override
  final Option<Failure> failure;

  @override
  String toString() {
    return 'SelectCityState(cities: $cities, cityUpdateState: $cityUpdateState, failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectCityImpl &&
            const DeepCollectionEquality().equals(other._cities, _cities) &&
            (identical(other.cityUpdateState, cityUpdateState) ||
                other.cityUpdateState == cityUpdateState) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_cities), cityUpdateState, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectCityImplCopyWith<_$SelectCityImpl> get copyWith =>
      __$$SelectCityImplCopyWithImpl<_$SelectCityImpl>(this, _$identity);
}

abstract class _SelectCity implements SelectCityState {
  const factory _SelectCity(
      {required final List<String> cities,
      required final CityUpdateState cityUpdateState,
      required final Option<Failure> failure}) = _$SelectCityImpl;

  @override
  List<String> get cities;
  @override
  CityUpdateState get cityUpdateState;
  @override
  Option<Failure> get failure;
  @override
  @JsonKey(ignore: true)
  _$$SelectCityImplCopyWith<_$SelectCityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

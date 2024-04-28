// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherDtoImpl _$$WeatherDtoImplFromJson(Map<String, dynamic> json) =>
    _$WeatherDtoImpl(
      weather: (json['weather'] as List<dynamic>)
          .map((e) => WeatherKey.fromJson(e as Map<String, dynamic>))
          .toList(),
      main: MainKey.fromJson(json['main'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WeatherDtoImplToJson(_$WeatherDtoImpl instance) =>
    <String, dynamic>{
      'weather': instance.weather,
      'main': instance.main,
    };

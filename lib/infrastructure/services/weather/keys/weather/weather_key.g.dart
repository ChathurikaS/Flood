// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_key.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherKeyImpl _$$WeatherKeyImplFromJson(Map<String, dynamic> json) =>
    _$WeatherKeyImpl(
      id: (json['id'] as num).toInt(),
      main: json['main'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$$WeatherKeyImplToJson(_$WeatherKeyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherImpl _$$WeatherImplFromJson(Map<String, dynamic> json) =>
    _$WeatherImpl(
      title: json['title'] as String,
      icon: json['icon'] as String,
      temp: json['temp'] as String,
      maxTemp: json['maxTemp'] as String,
      humidity: json['humidity'] as String,
    );

Map<String, dynamic> _$$WeatherImplToJson(_$WeatherImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'icon': instance.icon,
      'temp': instance.temp,
      'maxTemp': instance.maxTemp,
      'humidity': instance.humidity,
    };

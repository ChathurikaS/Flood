// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForecastDtoImpl _$$ForecastDtoImplFromJson(Map<String, dynamic> json) =>
    _$ForecastDtoImpl(
      date: json['dt'] as int,
      weather: (json['weather'] as List<dynamic>)
          .map((e) => WeatherKey.fromJson(e as Map<String, dynamic>))
          .toList(),
      main: MainKey.fromJson(json['main'] as Map<String, dynamic>),
      dtText: json['dt_txt'] as String,
    );

Map<String, dynamic> _$$ForecastDtoImplToJson(_$ForecastDtoImpl instance) =>
    <String, dynamic>{
      'dt': instance.date,
      'weather': instance.weather,
      'main': instance.main,
      'dt_txt': instance.dtText,
    };

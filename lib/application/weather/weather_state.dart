part of 'weather_cubit.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.loading() = _Loading;
  const factory WeatherState.loaded({
    required Weather weather,
    required List<Forecast> forecast,
  }) = _Loaded;
  const factory WeatherState.failed({
    required Failure failure,
  }) = _Failed;
}

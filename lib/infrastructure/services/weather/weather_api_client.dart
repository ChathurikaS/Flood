import 'package:dio/dio.dart';

class WeatherApiClient {
  final String key;
  WeatherApiClient(this.key);

  factory WeatherApiClient.create() {
    return WeatherApiClient("96aa7894ffbed4f20581e9f5352e05a3");
  }

  Dio get weather {
    final dio = Dio();
    dio.options.baseUrl =
        "https://api.openweathermap.org/data/2.5/weather?appid=$key";
    return dio;
  }

  Dio get forecast {
    final dio = Dio();
    dio.options.baseUrl =
        "https://api.openweathermap.org/data/2.5/forecast?appid=$key";
    return dio;
  }
}

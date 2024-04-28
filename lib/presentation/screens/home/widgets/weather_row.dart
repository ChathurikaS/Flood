import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/application/weather/weather_cubit.dart';
import 'package:flutter_application_1/domain/weather/weather.dart';
import 'package:flutter_application_1/presentation/screens/home/widgets/measurement_card.dart';

class WeatherRow extends StatelessWidget {
  const WeatherRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (weather, forecast) => _View(weather: weather),
          orElse: () => const _View(),
        );
      },
    );
  }
}

class _View extends StatelessWidget {
  final Weather? weather;

  const _View({this.weather});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const MeasurementCard(
            title: "Water Level",
            value: "23 cm",
            image: "assets/icons/weather/sleet.png"),
        MeasurementCard(
            title: "Humidity Level",
            value: weather == null ? "" : weather!.humidity.toString(),
            image: "assets/icons/weather/humidity.png"),
        MeasurementCard(
            title: "Max Temp",
            value: weather == null ? "" : weather!.maxTemp,
            image: "assets/icons/weather/max-temp.png"),
      ],
    );
  }
}

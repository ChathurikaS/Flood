import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/watch_city/watch_city_cubit.dart';
import 'package:flutter_application_1/domain/city/city.dart';
import 'package:flutter_application_1/presentation/router/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/application/weather/weather_cubit.dart';
import 'package:flutter_application_1/domain/weather/weather.dart';
import 'package:flutter_application_1/presentation/screens/home/widgets/measurement_card.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class WeatherRow extends HookWidget {
  final City city;

  const WeatherRow({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    useEffect(
        () => () => context.read<WatchCityCubit>().watch(city.id), [city]);

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
        BlocBuilder<WatchCityCubit, City?>(
          builder: (context, state) {
            if (state == null) {
              return const MeasurementCard(
                  title: "Rainfall",
                  value: "0 mm",
                  image: "assets/icons/weather/sleet.png");
            }
            return MeasurementCard(
              title: "Rainfall",
              value: "${state.rainfall} mm",
              image: "assets/icons/weather/sleet.png",
              onTap: () => context.router.push(WaterLevelRoute(city: state)),
            );
          },
        ),
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

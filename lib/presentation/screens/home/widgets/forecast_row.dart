import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/application/weather/weather_cubit.dart';
import 'package:flutter_application_1/presentation/screens/home/widgets/wether_day_card.dart';

class ForecastRow extends StatelessWidget {
  const ForecastRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (_, forecast) => SizedBox(
            height: 148,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: forecast.length,
                itemBuilder: (context, index) {
                  return WetherDayCard(
                    isFirst: index == 0,
                    isLast: index == forecast.length - 1,
                    forecast: forecast[index],
                  );
                }),
          ),
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}

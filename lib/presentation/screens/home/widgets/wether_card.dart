import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/application/weather/weather_cubit.dart';
import 'package:flutter_application_1/domain/weather/weather.dart';
import 'package:flutter_application_1/presentation/widgets/snackbar.dart';
import 'package:flutter_application_1/presentation/widgets/space.dart';
import 'package:flutter_application_1/presentation/widgets/text.dart';

class WetherCard extends StatelessWidget {
  const WetherCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
        state.maybeWhen(
            failed: (failure) =>
                showFailedSnackbar(context: context, message: failure.message),
            orElse: () {});
      },
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (weather, _) => _View(weather: weather),
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
    final theme = Theme.of(context);
    return Stack(
      children: [
        Column(
          children: [
            const VGap(gap: 24),
            Material(
              elevation: 12,
              borderRadius: BorderRadius.circular(12),
              color: theme.primaryColor.withOpacity(0.8),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextLarge(
                      weather == null ? "Loading..." : weather!.title,
                      color: Colors.white,
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        TextExLarge(
                          weather == null ? "00" : weather!.temp.toString(),
                          color: const Color(0xFFA1E2EB),
                          fontSize: 62,
                          bold: true,
                        ),
                        const VGap(gap: 60),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset(
            "assets/icons/weather/${weather == null ? "01d" : weather!.icon}.png",
            width: 100,
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }
}

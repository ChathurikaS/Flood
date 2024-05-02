import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/watch_city/watch_city_cubit.dart';
import 'package:flutter_application_1/domain/city/city.dart';
import 'package:flutter_application_1/injection.dart';
import 'package:flutter_application_1/presentation/screens/water_level/widgets/water_bubble.dart';
import 'package:flutter_application_1/presentation/widgets/text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class WaterLevelPage extends StatelessWidget {
  final City city;

  const WaterLevelPage({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColorLight,
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        title: TextMedium(
          "Rainfall in ${city.name}",
          color: Colors.white,
          bold: true,
        ),
      ),
      body: BlocProvider(
        create: (context) => getIt<WatchCityCubit>()..watch(city.id),
        child: BlocBuilder<WatchCityCubit, City?>(
          builder: (context, state) {
            if (state == null) {
              return const WaterBubble(waterLevel: 0);
            }
            return WaterBubble(waterLevel: state.rainfall.toDouble());
          },
        ),
      ),
    );
  }
}

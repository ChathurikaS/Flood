import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/auth/auth_cubit.dart';
import 'package:flutter_application_1/application/weather/weather_cubit.dart';
import 'package:flutter_application_1/core/extensions/dartz_x.dart';
import 'package:flutter_application_1/injection.dart';
import 'package:flutter_application_1/presentation/core/theme.dart';
import 'package:flutter_application_1/presentation/router/app_router.dart';
import 'package:flutter_application_1/presentation/screens/home/widgets/forecast_row.dart';
import 'package:flutter_application_1/presentation/screens/home/widgets/weather_row.dart';
import 'package:flutter_application_1/presentation/screens/home/widgets/wether_card.dart';
import 'package:flutter_application_1/presentation/widgets/admin_dialog.dart';
import 'package:flutter_application_1/presentation/widgets/space.dart';
import 'package:flutter_application_1/presentation/widgets/text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state.city.isNone()) {
          return Scaffold(
              body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextRegular("No cities found, please add a city first."),
                const VGap(gap: 20),
                TextButton(
                    onPressed: () => context.router.push(CreateCityRoute()),
                    child: const TextRegular("Add City")),
              ],
            ),
          ));
        }
        final city = state.city.getOrCrash();
        return Builder(builder: (context) {
          return BlocProvider(
            create: (context) => getIt<WeatherCubit>()..loadWeather(city.name),
            child: BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state.city.isSome()) {
                  context.read<WeatherCubit>().loadWeather(city.name);
                }
              },
              child: Scaffold(
                backgroundColor: theme.backgroundLight,
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const VGap(gap: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              TextButton.icon(
                                onPressed: () => showAdminDialog(context, city),
                                icon: const Icon(Icons.person_2_rounded),
                                label: const TextMedium("Admin"),
                              ),
                              const Spacer(),
                              TextButton.icon(
                                onPressed: () => context.router
                                    .push(SelectCityRoute(isTemp: true)),
                                icon: Image.asset("assets/icons/system/pin.png",
                                    width: 28, height: 28),
                                label: Row(
                                  children: [
                                    TextMedium(
                                      city.name,
                                      color: Colors.black,
                                    ),
                                    const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const VGap(gap: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextLarge(
                            city.name,
                            bold: true,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextMedium("Friday, 9 February"),
                        ),
                        const VGap(gap: 20),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: WetherCard(),
                        ),
                        const VGap(gap: 30),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: WeatherRow(city: city)),
                        const VGap(gap: 20),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextMedium(
                            "Today",
                            bold: true,
                          ),
                        ),
                        const VGap(gap: 20),
                        const ForecastRow(),
                        const VGap(gap: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
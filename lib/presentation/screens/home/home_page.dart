import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/application/auth/auth_cubit.dart';
import 'package:flutter_application_1/application/weather/weather_cubit.dart';
import 'package:flutter_application_1/domain/user/user.dart';
import 'package:flutter_application_1/injection.dart';
import 'package:flutter_application_1/presentation/core/theme.dart';
import 'package:flutter_application_1/presentation/router/app_router.dart';
import 'package:flutter_application_1/presentation/screens/home/widgets/forecast_row.dart';
import 'package:flutter_application_1/presentation/screens/home/widgets/weather_row.dart';
import 'package:flutter_application_1/presentation/screens/home/widgets/wether_card.dart';
import 'package:flutter_application_1/presentation/widgets/space.dart';
import 'package:flutter_application_1/presentation/widgets/text.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final user = state.user.getOrElse(() => User.empty());
        return Builder(builder: (context) {
          return BlocProvider(
            create: (context) => getIt<WeatherCubit>()..loadWeather(user.city),
            child: BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                context
                    .read<WeatherCubit>()
                    .loadWeather(state.user.getOrElse(() => User.empty()).city);
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
                              InkWell(
                                onTap: () =>
                                    context.router.push(const ProfileRoute()),
                                child: Image.asset(
                                  "assets/images/profile.png",
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
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
                                      user.city,
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
                            user.city,
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
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: WeatherRow()),
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

// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_1/application/auth/auth_cubit.dart';
import 'package:flutter_application_1/application/cities/cities_cubit.dart';
import 'package:flutter_application_1/application/select_city/select_city_cubit.dart';
import 'package:flutter_application_1/domain/city/city.dart';
import 'package:flutter_application_1/injection.dart';
import 'package:flutter_application_1/presentation/core/theme.dart';
import 'package:flutter_application_1/presentation/router/app_router.dart';
import 'package:flutter_application_1/presentation/widgets/loading.dart';
import 'package:flutter_application_1/presentation/widgets/snackbar.dart';
import 'package:flutter_application_1/presentation/widgets/space.dart';
import 'package:flutter_application_1/presentation/widgets/text.dart';

@RoutePage()
class SelectCityPage extends StatelessWidget {
  final bool isTemp;

  const SelectCityPage({super.key, required this.isTemp});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SelectCityCubit>(
            create: (context) => getIt<SelectCityCubit>()),
        BlocProvider<CitiesCubit>(
            create: (context) => getIt<CitiesCubit>()..load()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<SelectCityCubit, SelectCityState>(
            listener: (context, state) {
              state.maybeWhen(
                failed: (failure) {
                  showFailedSnackbar(
                      context: context, message: failure.message);
                },
                succeed: () {
                  context.router.replaceAll([const HomeRoute()]);
                },
                orElse: () {},
              );
            },
          ),
          BlocListener<CitiesCubit, CitiesState>(
            listener: (context, state) {
              state.maybeWhen(
                failed: (failure) {
                  showFailedSnackbar(
                      context: context, message: failure.message);
                },
                orElse: () {},
              );
            },
          ),
        ],
        child: Builder(builder: (context) {
          return LoadablePage(
            isLoading: context
                .watch<SelectCityCubit>()
                .state
                .maybeWhen(loading: () => true, orElse: () => false),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: const TextMedium(
                "Select City",
                color: Colors.white,
                bold: true,
              ),
              actions: [
                if (isTemp)
                  IconButton(
                    onPressed: () => context.router.maybePop(),
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                    ),
                  ),
                if (!isTemp)
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        user: (user, _) => TextButton(
                          onPressed: () => context
                              .read<SelectCityCubit>()
                              .updateCityWithUser(user),
                          child: const TextRegular(
                            "Done",
                            color: Colors.white,
                          ),
                        ),
                        orElse: () => const SizedBox(),
                      );
                    },
                  )
              ],
            ),
            body: BlocBuilder<CitiesCubit, CitiesState>(
              builder: (context, state) {
                return state.maybeWhen(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    loaded: (cities) => _LoadedView(
                          cities: cities,
                        ),
                    orElse: () => const SizedBox());
              },
            ),
          );
        }),
      ),
    );
  }
}

class _LoadedView extends StatelessWidget {
  final List<City> cities;

  const _LoadedView({required this.cities});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<CitiesCubit, CitiesState>(
      builder: (context, state) {
        return state.maybeWhen(
            loaded: (cities) => Container(
                  color: theme.backgroundLight,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: cities.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _CityCard(
                          city: cities[index], isFirst: index == 0);
                    },
                  ),
                ),
            orElse: () => const SizedBox());
      },
    );
  }
}

class _CityCard extends StatelessWidget {
  final City city;
  final bool isFirst;

  const _CityCard({
    required this.city,
    required this.isFirst,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 20, top: isFirst ? 20 : 0),
      child: Material(
        elevation: 12,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black.withOpacity(.5)),
            borderRadius: BorderRadius.circular(8)),
        color: theme.backgroundLight,
        shadowColor: Colors.black.withOpacity(.5),
        child: InkWell(
          onTap: () => context.read<AuthCubit>().changeCity(city),
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              children: [
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      user: (_, userCity) =>
                          _CheckBox(isSelected: userCity.id == city.id),
                      admin: (_, adminCity) {
                        if (adminCity == null) {
                          return const _CheckBox(isSelected: false);
                        }
                        return _CheckBox(isSelected: adminCity.id == city.id);
                      },
                      orElse: () => const _CheckBox(isSelected: false),
                    );
                  },
                ),
                const HGap(gap: 20),
                TextMedium(
                  city.name,
                  color: Colors.black,
                  bold: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CheckBox extends StatelessWidget {
  final bool isSelected;

  const _CheckBox({required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/icons/system/${isSelected ? "checked" : "unchecked"}.png",
      width: 32,
      height: 32,
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_1/application/auth/auth_cubit.dart';
import 'package:flutter_application_1/application/cities/cities_cubit.dart';
import 'package:flutter_application_1/application/select_city/select_city_cubit.dart';
import 'package:flutter_application_1/core/extensions/dartz_x.dart';
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
    return BlocProvider(
      create: (context) => getIt<CitiesCubit>()..load(),
      child: Scaffold(
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
              TextButton(
                onPressed: () {
                  final user = context
                      .read<AuthCubit>()
                      .state
                      .user
                      .fold(() => null, (a) => a);
                  if (user == null) {
                    return;
                  }
                  context.read<SelectCityCubit>().updateCityWithUser(user);
                },
                child: const TextRegular(
                  "Done",
                  color: Colors.white,
                ),
              )
          ],
        ),
        body: BlocBuilder<CitiesCubit, CitiesState>(
          builder: (context, state) {
            return state.maybeWhen(
                loading: () => const Center(child: CircularProgressIndicator()),
                loaded: (cities) => _LoadedView(
                    cities: cities,
                    onSucceed: () =>
                        context.router.replaceAll([const HomeRoute()])),
                orElse: () => const SizedBox());
          },
        ),
      ),
    );
  }
}

class _LoadedView extends StatelessWidget {
  final List<City> cities;
  final Function() onSucceed;

  const _LoadedView({required this.cities, required this.onSucceed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => getIt<SelectCityCubit>(),
      child: BlocListener<SelectCityCubit, SelectCityState>(
        listener: (context, state) {
          state.maybeWhen(
            failed: (failure) {
              showFailedSnackbar(context: context, message: failure.message);
              return;
            },
            succeed: onSucceed,
            orElse: () {},
          );
        },
        child: Builder(builder: (context) {
          return LoadablePage(
            isLoading: context.watch<SelectCityCubit>().state.maybeWhen(
                  loading: () => true,
                  orElse: () => false,
                ),
            body: Container(
              color: theme.backgroundLight,
              child: BlocBuilder<CitiesCubit, CitiesState>(
                builder: (context, state) {
                  return state.maybeWhen(
                      loaded: (cities) => ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            itemCount: cities.length,
                            itemBuilder: (BuildContext context, int index) {
                              return _CityCard(
                                  city: cities[index], isFirst: index == 0);
                            },
                          ),
                      orElse: () => const SizedBox());
                },
              ),
            ),
          );
        }),
      ),
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
                _CheckBox(city: city),
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
  final City city;

  const _CheckBox({required this.city});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state.city.isNone()) {
          return Image.asset(
            "assets/icons/system/unchecked.png",
            width: 32,
            height: 32,
          );
        }

        bool isSelected = false;
        if (state.city.getOrCrash().id == city.id) {
          isSelected = true;
        }
        return Image.asset(
          "assets/icons/system/${isSelected ? "checked" : "unchecked"}.png",
          width: 32,
          height: 32,
        );
      },
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/application/auth/auth_cubit.dart';
import 'package:flutter_application_1/application/select_city/select_city_cubit.dart';
import 'package:flutter_application_1/domain/user/user.dart';
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
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => getIt<SelectCityCubit>(),
      child: BlocListener<SelectCityCubit, SelectCityState>(
        listener: (context, state) {
          if (state.cityUpdateState == CityUpdateState.success) {
            context.router.replaceAll([const HomeRoute()]);
            return;
          }
          if (state.cityUpdateState == CityUpdateState.failed) {
            showFailedSnackbar(
              context: context,
              message: state.failure.fold(
                () => "Something went wrong",
                (a) => a.message,
              ),
            );
            return;
          }
        },
        child: Builder(builder: (context) {
          return LoadablePage(
            isLoading: context.watch<SelectCityCubit>().state.cityUpdateState ==
                CityUpdateState.loading,
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
            body: Container(
              color: theme.backgroundLight,
              child: BlocBuilder<SelectCityCubit, SelectCityState>(
                builder: (context, state) {
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: state.cities.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: index == state.cities.length - 1 ? 20 : 12,
                            top: index == 0 ? 20 : 0),
                        child: Material(
                          elevation: 12,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.black.withOpacity(.5)),
                              borderRadius: BorderRadius.circular(8)),
                          color: theme.backgroundLight,
                          shadowColor: Colors.black.withOpacity(.5),
                          child: InkWell(
                            onTap: () {
                              context.read<AuthCubit>().tempUser(context
                                  .read<AuthCubit>()
                                  .state
                                  .user
                                  .getOrElse(() => User.empty())
                                  .copyWith(city: state.cities[index]));
                            },
                            borderRadius: BorderRadius.circular(8),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 16),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/icons/system/${state.cities.indexOf(context.watch<AuthCubit>().state.user.getOrElse(() => User.empty()).city) == index ? "checked" : "unchecked"}.png",
                                    width: 32,
                                    height: 32,
                                  ),
                                  const HGap(gap: 20),
                                  TextMedium(
                                    state.cities[index],
                                    color: Colors.black,
                                    bold: true,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/create_city/create_city_cubit.dart';
import 'package:flutter_application_1/core/mutable_object.dart';
import 'package:flutter_application_1/injection.dart';
import 'package:flutter_application_1/presentation/widgets/button.dart';
import 'package:flutter_application_1/presentation/widgets/loading.dart';
import 'package:flutter_application_1/presentation/widgets/snackbar.dart';
import 'package:flutter_application_1/presentation/widgets/space.dart';
import 'package:flutter_application_1/presentation/widgets/text_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CreateCityPage extends StatelessWidget {
  CreateCityPage({super.key});

  final mCity = MutableObject<String>("");

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CreateCityCubit>(),
      child: BlocListener<CreateCityCubit, CreateCityState>(
        listener: (context, state) {
          state.maybeWhen(
            succeed: () {
              showSuccessSnackbar(
                  context: context,
                  message: "${mCity.value} added successfully.");
              context.router.maybePop();
            },
            failed: (failure) {
              showFailedSnackbar(context: context, message: failure.message);
            },
            orElse: () {},
          );
        },
        child: Builder(builder: (context) {
          return LoadablePage(
            isLoading: context.watch<CreateCityCubit>().state.maybeWhen(
                  loading: () => true,
                  orElse: () => false,
                ),
            appBar: AppBar(
              title: const Text("Add City"),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextInput(
                      hint: "City Name",
                      label: "City",
                      onChanged: (value) => mCity.value = value),
                  const VGap(gap: 20),
                  BoxButton(
                      text: "Add",
                      isSecondary: true,
                      onPressed: () =>
                          context.read<CreateCityCubit>().create(mCity.value)),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

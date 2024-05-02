// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_1/application/update_rainfall/update_rainfall_cubit.dart';
import 'package:flutter_application_1/core/mutable_object.dart';
import 'package:flutter_application_1/domain/city/city.dart';
import 'package:flutter_application_1/injection.dart';
import 'package:flutter_application_1/presentation/widgets/button.dart';
import 'package:flutter_application_1/presentation/widgets/loading.dart';
import 'package:flutter_application_1/presentation/widgets/snackbar.dart';
import 'package:flutter_application_1/presentation/widgets/space.dart';
import 'package:flutter_application_1/presentation/widgets/text_input.dart';

@RoutePage()
class UpdateRainfallPage extends StatelessWidget {
  final City city;
  UpdateRainfallPage({
    super.key,
    required this.city,
  });

  final mRainfall = MutableObject(0);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UpdateRainfallCubit>(),
      child: BlocListener<UpdateRainfallCubit, UpdateRainfallState>(
        listener: (context, state) {
          state.maybeWhen(
            succeed: () {
              showSuccessSnackbar(
                  context: context,
                  message: "${city.name} rainfall updated successfully");
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
            isLoading: context.watch<UpdateRainfallCubit>().state.maybeWhen(
                  loading: () => true,
                  orElse: () => false,
                ),
            appBar: AppBar(
              title: Text("Update rainfall in ${city.name}"),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextInput(
                      keyboardType: TextInputType.number,
                      hint: "Rainfall in mm",
                      label: "Rainfall",
                      onChanged: (value) => mRainfall.value = int.parse(value)),
                  const VGap(gap: 20),
                  BoxButton(
                      text: "Add",
                      isSecondary: true,
                      onPressed: () => context
                          .read<UpdateRainfallCubit>()
                          .update(city.copyWith(rainfall: mRainfall.value))),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

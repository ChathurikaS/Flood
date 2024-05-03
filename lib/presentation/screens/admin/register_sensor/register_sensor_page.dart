import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/register_sensor/register_sensor_cubit.dart';
import 'package:flutter_application_1/domain/city/city.dart';
import 'package:flutter_application_1/injection.dart';
import 'package:flutter_application_1/presentation/widgets/snackbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class RegisterSensorPage extends StatelessWidget {
  final City city;

  const RegisterSensorPage({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterSensorCubit>()..registerSensor(city),
      child: BlocListener<RegisterSensorCubit, RegisterSensorState>(
        listener: (context, state) {
          state.maybeWhen(
              succeed: () {
                showSuccessSnackbar(
                    context: context, message: 'Sensor registered');
                context.router.maybePop();
              },
              failed: (failure) {
                showFailedSnackbar(
                    context: context, message: failure.toString());
              },
              orElse: () {});
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('Register Sensor to ${city.name}'),
          ),
          body: BlocBuilder<RegisterSensorCubit, RegisterSensorState>(
            builder: (context, state) {
              return state.maybeWhen(
                  orElse: () => const SizedBox(),
                  loading: () {
                    return const Center(child: CircularProgressIndicator());
                  });
            },
          ),
        ),
      ),
    );
  }
}

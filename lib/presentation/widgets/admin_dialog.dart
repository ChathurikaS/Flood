import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/auth/auth_cubit.dart';
import 'package:flutter_application_1/domain/city/city.dart';
import 'package:flutter_application_1/presentation/router/app_router.dart';
import 'package:flutter_application_1/presentation/widgets/space.dart';
import 'package:flutter_application_1/presentation/widgets/text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class _AdminDialog extends StatelessWidget {
  final City city;

  const _AdminDialog({required this.city});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          unauthenticated: () => context.router.replaceAll([LoginRoute()]),
          orElse: () {},
        );
      },
      child: Dialog(
        child: Material(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const TextRegular("Admin Actions", bold: true),
                const VGap(gap: 20),
                TextButton.icon(
                    onPressed: () => context.router.push(CreateCityRoute()),
                    icon: const Icon(Icons.location_city_rounded),
                    label: const Text("Add City")),
                const Divider(),
                TextButton.icon(
                    onPressed: () =>
                        context.router.push(RegisterSensorRoute(city: city)),
                    icon: const Icon(Icons.sensors_rounded),
                    label: Text("Register Sensor to ${city.name}")),
                const Divider(),
                TextButton.icon(
                    onPressed: () =>
                        context.router.push(UpdateRainfallRoute(city: city)),
                    icon: const Icon(Icons.cloudy_snowing),
                    label: Text("Update Rainfall in ${city.name}")),
                const Divider(),
                TextButton.icon(
                    onPressed: () => context.read<AuthCubit>().signOutAdmin(),
                    icon: const Icon(Icons.logout_rounded),
                    label: const Text("Log Out")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showAdminDialog(BuildContext context, City city) {
  showDialog(
    context: context,
    builder: (context) => _AdminDialog(city: city),
  );
}

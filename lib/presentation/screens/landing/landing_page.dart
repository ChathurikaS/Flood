import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/widgets/snackbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/application/auth/auth_cubit.dart';
import 'package:flutter_application_1/presentation/router/app_router.dart';
import 'package:flutter_application_1/presentation/widgets/space.dart';
import 'package:flutter_application_1/presentation/widgets/text.dart';

@RoutePage()
class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          user: (user, city) => context.router.replaceAll([const HomeRoute()]),
          admin: (admin, city) =>
              context.router.replaceAll([const AdminHomeRoute()]),
          unauthenticated: () => context.router.replaceAll([LoginRoute()]),
          failed: (failure) =>
              showFailedSnackbar(context: context, message: failure.message),
          orElse: () {},
        );
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/images/get-started.png",
                  width: 300,
                  fit: BoxFit.fitWidth,
                ),
                const VGap(gap: 20),
                const TextRegular(
                  "Loading...",
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

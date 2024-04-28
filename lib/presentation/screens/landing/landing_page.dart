import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/application/auth/auth_cubit.dart';
import 'package:flutter_application_1/presentation/router/app_router.dart';
import 'package:flutter_application_1/presentation/widgets/snackbar.dart';
import 'package:flutter_application_1/presentation/widgets/space.dart';
import 'package:flutter_application_1/presentation/widgets/text.dart';

@RoutePage()
class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (!state.isLoading && state.user.isSome()) {
          context.router.replaceAll([const HomeRoute()]);
          return;
        }
        if (state.failure.isSome()) {
          showFailedSnackbar(
              context: context,
              message: state.failure.fold(() => null, (a) => a.message));
          return;
        }
        if (!state.isLoading && state.user.isNone()) {
          context.router.replaceAll([LoginRoute()]);
          return;
        }
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

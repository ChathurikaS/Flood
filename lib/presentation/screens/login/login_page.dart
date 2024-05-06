import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/application/auth/auth_cubit.dart';
import 'package:flutter_application_1/application/login/login_cubit.dart';
import 'package:flutter_application_1/core/mutable_object.dart';
import 'package:flutter_application_1/injection.dart';
import 'package:flutter_application_1/presentation/router/app_router.dart';
import 'package:flutter_application_1/presentation/widgets/auth_bg.dart';
import 'package:flutter_application_1/presentation/widgets/button.dart';
import 'package:flutter_application_1/presentation/widgets/loading.dart';
import 'package:flutter_application_1/presentation/widgets/snackbar.dart';
import 'package:flutter_application_1/presentation/widgets/space.dart';
import 'package:flutter_application_1/presentation/widgets/text.dart';
import 'package:flutter_application_1/presentation/widgets/text_input.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final mEmail = MutableObject<String>("");
  final mPassword = MutableObject<String>("");

  bool _isLoading(BuildContext context) {
    return context.watch<LoginCubit>().state.maybeWhen(
              loading: () => true,
              orElse: () => false,
            ) ||
        context.watch<AuthCubit>().state.maybeWhen(
              loading: () => true,
              orElse: () => false,
            );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              state.maybeWhen(
                user: (user, _) =>
                    context.router.replaceAll([const HomeRoute()]),
                admin: (admin, _) =>
                    context.router.replaceAll([const AdminHomeRoute()]),
                orElse: () {},
              );
            },
          ),
          BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              state.maybeWhen(
                failed: (failure) {
                  showFailedSnackbar(
                      context: context, message: failure.message);
                },
                admin: (admin) => context.read<AuthCubit>().setAdmin(admin),
                orElse: () {},
              );
            },
          ),
        ],
        child: Builder(builder: (context) {
          return LoadablePage(
            isLoading: _isLoading(context),
            body: AuthBg(
                child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const VGap(gap: 200),
                    const TextExLarge(
                      "Log In",
                      color: Colors.white,
                      bold: true,
                      shadowed: true,
                    ),
                    const VGap(gap: 60),
                    TextInput(
                        hint: "Enter your email address",
                        label: "Email",
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) => mEmail.value = value),
                    const VGap(gap: 20),
                    TextInput(
                        hint: "Enter your password",
                        label: "Password",
                        keyboardType: TextInputType.visiblePassword,
                        isPassword: true,
                        onChanged: (value) => mPassword.value = value),
                    const VGap(gap: 20),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: TextRegular(
                        "Forgot Password?",
                        color: Colors.white,
                        shadowed: true,
                      ),
                    ),
                    const VGap(gap: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const HGap(gap: 20),
                        Expanded(
                          flex: 1,
                          child: BoxButton(
                            text: "Sign Up",
                            isSecondary: true,
                            onPressed: () =>
                                context.router.replaceAll([RegisterRoute()]),
                          ),
                        ),
                        const HGap(gap: 20),
                        Expanded(
                          flex: 1,
                          child: BoxButton(
                            text: "Log In",
                            isSecondary: true,
                            onPressed: () => context
                                .read<LoginCubit>()
                                .login(mEmail.value, mPassword.value),
                          ),
                        ),
                        const HGap(gap: 20),
                      ],
                    ),
                    const VGap(gap: 40),
                  ],
                ),
              ),
            )),
          );
        }),
      ),
    );
  }
}

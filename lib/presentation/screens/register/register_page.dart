import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/application/auth/auth_cubit.dart';
import 'package:flutter_application_1/application/register/register_cubit.dart';
import 'package:flutter_application_1/core/mutable_object.dart';
import 'package:flutter_application_1/domain/user/user.dart';
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
class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final mUser = MutableObject(User.empty());
  final mPassword = MutableObject("");
  final mConfirmPassword = MutableObject("");

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterCubit>(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              state.maybeWhen(
                user: (user, _) =>
                    context.router.replaceAll([SelectCityRoute(isTemp: false)]),
                orElse: () {},
              );
            },
          ),
          BlocListener<RegisterCubit, RegisterState>(
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
            isLoading: context.watch<RegisterCubit>().state.maybeWhen(
                  loading: () => true,
                  orElse: () => false,
                ),
            body: AuthBg(
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const VGap(gap: 100),
                      const TextExLarge(
                        "Sign Up",
                        color: Colors.white,
                        bold: true,
                        shadowed: true,
                      ),
                      const VGap(gap: 60),
                      TextInput(
                          hint: "Enter your first name",
                          label: "First Name",
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) => mUser.value =
                              mUser.value.copyWith(firstName: value)),
                      const VGap(gap: 20),
                      TextInput(
                          hint: "Enter your last name",
                          label: "Last Name",
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) => mUser.value =
                              mUser.value.copyWith(lastName: value)),
                      const VGap(gap: 20),
                      TextInput(
                          hint: "Enter your email address",
                          label: "Email",
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) =>
                              mUser.value = mUser.value.copyWith(email: value)),
                      const VGap(gap: 20),
                      TextInput(
                          hint: "Enter your password",
                          label: "Password",
                          isPassword: true,
                          onChanged: (value) => mPassword.value = value),
                      const VGap(gap: 20),
                      TextInput(
                          hint: "Enter your password",
                          label: "Confirm Password",
                          isPassword: true,
                          onChanged: (value) => mConfirmPassword.value = value),
                      const VGap(gap: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const HGap(gap: 20),
                          Expanded(
                            flex: 1,
                            child: BoxButton(
                              text: "Log In",
                              isSecondary: true,
                              onPressed: () =>
                                  context.router.replaceAll([LoginRoute()]),
                            ),
                          ),
                          const HGap(gap: 20),
                          Expanded(
                            flex: 1,
                            child: BoxButton(
                              text: "Sign Up",
                              isSecondary: true,
                              onPressed: () => context
                                  .read<RegisterCubit>()
                                  .register(
                                      user: mUser.value,
                                      password: mPassword.value,
                                      confirmPassword: mConfirmPassword.value),
                            ),
                          ),
                          const HGap(gap: 20),
                        ],
                      ),
                      const VGap(gap: 40),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

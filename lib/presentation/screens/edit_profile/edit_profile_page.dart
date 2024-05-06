import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/application/auth/auth_cubit.dart';
import 'package:flutter_application_1/application/update_user/update_user_cubit.dart';
import 'package:flutter_application_1/core/mutable_object.dart';
import 'package:flutter_application_1/domain/user/user.dart';
import 'package:flutter_application_1/injection.dart';
import 'package:flutter_application_1/presentation/widgets/button.dart';
import 'package:flutter_application_1/presentation/widgets/loading.dart';
import 'package:flutter_application_1/presentation/widgets/snackbar.dart';
import 'package:flutter_application_1/presentation/widgets/space.dart';
import 'package:flutter_application_1/presentation/widgets/text.dart';
import 'package:flutter_application_1/presentation/widgets/text_input.dart';

@RoutePage()
class EditProfilePage extends StatelessWidget {
  EditProfilePage({super.key});

  final mUser = MutableObject(User.empty());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UpdateUserCubit>(),
      child: BlocListener<UpdateUserCubit, UpdateUserState>(
        listener: (context, state) {
          state.maybeWhen(
            succeed: (_) {
              showSuccessSnackbar(
                  context: context, message: "Profile updated successfully");
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
            isLoading: context.watch<UpdateUserCubit>().state.maybeWhen(
                  loading: () => true,
                  orElse: () => false,
                ),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: const TextExLarge(
                "Profile",
                color: Colors.white,
                bold: true,
              ),
            ),
            body: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                state.maybeWhen(
                  user: (user, _) => mUser.value = user,
                  orElse: () {},
                );
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const VGap(gap: 100),
                      TextInput(
                          hint: "Enter your first name",
                          label: "First Name",
                          initialValue: mUser.value.firstName,
                          keyboardType: TextInputType.name,
                          backgroundColor:
                              const Color(0xFF4793CA).withOpacity(0.5),
                          onChanged: (value) => mUser.value =
                              mUser.value.copyWith(firstName: value)),
                      const VGap(gap: 20),
                      TextInput(
                          hint: "Enter your last name",
                          label: "Last Name",
                          initialValue: mUser.value.lastName,
                          keyboardType: TextInputType.name,
                          backgroundColor:
                              const Color(0xFF77ACDD).withOpacity(0.5),
                          onChanged: (value) => mUser.value =
                              mUser.value.copyWith(lastName: value)),
                      const VGap(gap: 20),
                      TextInput(
                          hint: "Enter your telephone number",
                          label: "Tele No",
                          initialValue: mUser.value.phone,
                          keyboardType: TextInputType.phone,
                          backgroundColor:
                              const Color(0xFF8BB6D6).withOpacity(0.5),
                          onChanged: (value) =>
                              mUser.value = mUser.value.copyWith(phone: value)),
                      const VGap(gap: 20),
                      TextInput(
                          hint: "Enter your NIC number",
                          label: "NIC",
                          initialValue: mUser.value.nic,
                          backgroundColor:
                              const Color(0xFFAED0E9).withOpacity(0.5),
                          onChanged: (value) =>
                              mUser.value = mUser.value.copyWith(nic: value)),
                      const VGap(gap: 40),
                      BoxButton(
                        text: "Save",
                        onPressed: () =>
                            context.read<UpdateUserCubit>().update(mUser.value),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}

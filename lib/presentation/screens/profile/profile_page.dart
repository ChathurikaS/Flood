import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/application/auth/auth_cubit.dart';
import 'package:flutter_application_1/domain/user/user.dart';
import 'package:flutter_application_1/presentation/router/app_router.dart';
import 'package:flutter_application_1/presentation/screens/profile/widgets/info_field.dart';
import 'package:flutter_application_1/presentation/widgets/button.dart';
import 'package:flutter_application_1/presentation/widgets/loading.dart';
import 'package:flutter_application_1/presentation/widgets/space.dart';
import 'package:flutter_application_1/presentation/widgets/text.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          unauthenticated: () => context.router.replaceAll([LoginRoute()]),
          orElse: () {},
        );
      },
      child: LoadablePage(
        isLoading: context.watch<AuthCubit>().state.maybeWhen(
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
          actions: [
            IconButton(
              icon: const Icon(
                Icons.logout_rounded,
                color: Colors.white,
              ),
              onPressed: () => context.read<AuthCubit>().signOutUser(),
            ),
          ],
        ),
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return state.maybeWhen(
              user: (user, _) => _ProfileBody(user: user),
              orElse: () => const SizedBox(),
            );
          },
        ),
      ),
    );
  }
}

class _ProfileBody extends StatelessWidget {
  final User user;

  const _ProfileBody({required this.user});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const VGap(gap: 100),
          InfoField(
            info: user.firstName,
            color: const Color(0xFF4793CA),
          ),
          const VGap(gap: 20),
          InfoField(
            info: user.lastName,
            color: const Color(0xFF77ACDD),
          ),
          const VGap(gap: 20),
          InfoField(
            info: user.email,
            color: const Color(0xFF8BB6D6),
          ),
          const VGap(gap: 20),
          InfoField(
            info: user.phone,
            color: const Color(0xFFAED0E9),
          ),
          const VGap(gap: 20),
          InfoField(
            info: user.nic,
            color: const Color(0xFFD4E6F2),
          ),
          const VGap(gap: 40),
          BoxButton(
            text: "Edit",
            onPressed: () => context.router.push(
              EditProfileRoute(),
            ),
          ),
        ],
      ),
    );
  }
}

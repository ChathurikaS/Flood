import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/application/auth/auth_cubit.dart';
import 'package:flutter_application_1/injection.dart';
import 'package:flutter_application_1/presentation/core/theme.dart';

import 'router/app_router.dart';

class App extends StatelessWidget {
  App({super.key});

  final _routerConfig = AppRouter().config();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>()..watch(),
      child: MaterialApp.router(
        title: "SL Flood Mate",
        debugShowCheckedModeBanner: false,
        theme: AppTheme().config(),
        routerConfig: _routerConfig,
      ),
    );
  }
}

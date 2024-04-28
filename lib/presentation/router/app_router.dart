import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/screens/edit_profile/edit_profile_page.dart';
import 'package:flutter_application_1/presentation/screens/home/home_page.dart';
import 'package:flutter_application_1/presentation/screens/login/login_page.dart';
import 'package:flutter_application_1/presentation/screens/profile/profile_page.dart';
import 'package:flutter_application_1/presentation/screens/register/register_page.dart';
import 'package:flutter_application_1/presentation/screens/select_city/select_city_page.dart';
import 'package:flutter_application_1/presentation/screens/water_level/water_level_page.dart';
import '/presentation/screens/landing/landing_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LandingRoute.page, path: "/"),
        AutoRoute(page: LoginRoute.page, path: "/login"),
        AutoRoute(page: RegisterRoute.page, path: "/register"),
        AutoRoute(page: HomeRoute.page, path: "/home"),
        AutoRoute(page: SelectCityRoute.page, path: "/select-city"),
        AutoRoute(page: WaterLevelRoute.page, path: "/water-level"),
        AutoRoute(page: ProfileRoute.page, path: "/profile"),
        AutoRoute(page: EditProfileRoute.page, path: "/edit-profile"),
      ];
}

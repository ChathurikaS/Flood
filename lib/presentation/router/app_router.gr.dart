// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AdminHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AdminHomePage(),
      );
    },
    CreateCityRoute.name: (routeData) {
      final args = routeData.argsAs<CreateCityRouteArgs>(
          orElse: () => const CreateCityRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreateCityPage(key: args.key),
      );
    },
    EditProfileRoute.name: (routeData) {
      final args = routeData.argsAs<EditProfileRouteArgs>(
          orElse: () => const EditProfileRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditProfilePage(key: args.key),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    LandingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LandingPage(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginPage(key: args.key),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RegisterPage(key: args.key),
      );
    },
    SelectCityRoute.name: (routeData) {
      final args = routeData.argsAs<SelectCityRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SelectCityPage(
          key: args.key,
          isTemp: args.isTemp,
        ),
      );
    },
    UpdateRainfallRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateRainfallRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UpdateRainfallPage(
          key: args.key,
          city: args.city,
        ),
      );
    },
    WaterLevelRoute.name: (routeData) {
      final args = routeData.argsAs<WaterLevelRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WaterLevelPage(
          key: args.key,
          city: args.city,
        ),
      );
    },
  };
}

/// generated route for
/// [AdminHomePage]
class AdminHomeRoute extends PageRouteInfo<void> {
  const AdminHomeRoute({List<PageRouteInfo>? children})
      : super(
          AdminHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateCityPage]
class CreateCityRoute extends PageRouteInfo<CreateCityRouteArgs> {
  CreateCityRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CreateCityRoute.name,
          args: CreateCityRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CreateCityRoute';

  static const PageInfo<CreateCityRouteArgs> page =
      PageInfo<CreateCityRouteArgs>(name);
}

class CreateCityRouteArgs {
  const CreateCityRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'CreateCityRouteArgs{key: $key}';
  }
}

/// generated route for
/// [EditProfilePage]
class EditProfileRoute extends PageRouteInfo<EditProfileRouteArgs> {
  EditProfileRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EditProfileRoute.name,
          args: EditProfileRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const PageInfo<EditProfileRouteArgs> page =
      PageInfo<EditProfileRouteArgs>(name);
}

class EditProfileRouteArgs {
  const EditProfileRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'EditProfileRouteArgs{key: $key}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LandingPage]
class LandingRoute extends PageRouteInfo<void> {
  const LandingRoute({List<PageRouteInfo>? children})
      : super(
          LandingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LandingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          RegisterRoute.name,
          args: RegisterRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<RegisterRouteArgs> page =
      PageInfo<RegisterRouteArgs>(name);
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SelectCityPage]
class SelectCityRoute extends PageRouteInfo<SelectCityRouteArgs> {
  SelectCityRoute({
    Key? key,
    required bool isTemp,
    List<PageRouteInfo>? children,
  }) : super(
          SelectCityRoute.name,
          args: SelectCityRouteArgs(
            key: key,
            isTemp: isTemp,
          ),
          initialChildren: children,
        );

  static const String name = 'SelectCityRoute';

  static const PageInfo<SelectCityRouteArgs> page =
      PageInfo<SelectCityRouteArgs>(name);
}

class SelectCityRouteArgs {
  const SelectCityRouteArgs({
    this.key,
    required this.isTemp,
  });

  final Key? key;

  final bool isTemp;

  @override
  String toString() {
    return 'SelectCityRouteArgs{key: $key, isTemp: $isTemp}';
  }
}

/// generated route for
/// [UpdateRainfallPage]
class UpdateRainfallRoute extends PageRouteInfo<UpdateRainfallRouteArgs> {
  UpdateRainfallRoute({
    Key? key,
    required City city,
    List<PageRouteInfo>? children,
  }) : super(
          UpdateRainfallRoute.name,
          args: UpdateRainfallRouteArgs(
            key: key,
            city: city,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateRainfallRoute';

  static const PageInfo<UpdateRainfallRouteArgs> page =
      PageInfo<UpdateRainfallRouteArgs>(name);
}

class UpdateRainfallRouteArgs {
  const UpdateRainfallRouteArgs({
    this.key,
    required this.city,
  });

  final Key? key;

  final City city;

  @override
  String toString() {
    return 'UpdateRainfallRouteArgs{key: $key, city: $city}';
  }
}

/// generated route for
/// [WaterLevelPage]
class WaterLevelRoute extends PageRouteInfo<WaterLevelRouteArgs> {
  WaterLevelRoute({
    Key? key,
    required City city,
    List<PageRouteInfo>? children,
  }) : super(
          WaterLevelRoute.name,
          args: WaterLevelRouteArgs(
            key: key,
            city: city,
          ),
          initialChildren: children,
        );

  static const String name = 'WaterLevelRoute';

  static const PageInfo<WaterLevelRouteArgs> page =
      PageInfo<WaterLevelRouteArgs>(name);
}

class WaterLevelRouteArgs {
  const WaterLevelRouteArgs({
    this.key,
    required this.city,
  });

  final Key? key;

  final City city;

  @override
  String toString() {
    return 'WaterLevelRouteArgs{key: $key, city: $city}';
  }
}

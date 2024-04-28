// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:flutter_application_1/application/auth/auth_cubit.dart' as _i19;
import 'package:flutter_application_1/application/login/login_cubit.dart'
    as _i20;
import 'package:flutter_application_1/application/register/register_cubit.dart'
    as _i16;
import 'package:flutter_application_1/application/select_city/select_city_cubit.dart'
    as _i17;
import 'package:flutter_application_1/application/update_user/update_user_cubit.dart'
    as _i18;
import 'package:flutter_application_1/application/weather/weather_cubit.dart'
    as _i15;
import 'package:flutter_application_1/domain/auth/i_auth_facade.dart' as _i8;
import 'package:flutter_application_1/domain/user/i_user_repo.dart' as _i13;
import 'package:flutter_application_1/domain/weather/i_weather_repo.dart'
    as _i11;
import 'package:flutter_application_1/infrastructure/repo/auth_repo.dart'
    as _i9;
import 'package:flutter_application_1/infrastructure/repo/user_repo.dart'
    as _i14;
import 'package:flutter_application_1/infrastructure/repo/weather_repo.dart'
    as _i12;
import 'package:flutter_application_1/infrastructure/services/auth_service.dart'
    as _i7;
import 'package:flutter_application_1/infrastructure/services/core/injectable_modules.dart'
    as _i21;
import 'package:flutter_application_1/infrastructure/services/user_service.dart'
    as _i10;
import 'package:flutter_application_1/infrastructure/services/weather/weather_api_client.dart'
    as _i5;
import 'package:flutter_application_1/infrastructure/services/weather/weather_service.dart'
    as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModules = _$InjectableModules();
    gh.lazySingleton<_i3.FirebaseAuth>(() => injectableModules.auth);
    gh.lazySingleton<_i4.FirebaseFirestore>(() => injectableModules.firestore);
    gh.lazySingleton<_i5.WeatherApiClient>(
        () => injectableModules.weatherApiClient);
    gh.lazySingleton<_i6.WeatherService>(
        () => _i6.WeatherService(gh<_i5.WeatherApiClient>()));
    gh.lazySingleton<_i7.AuthService>(
        () => _i7.AuthService(gh<_i3.FirebaseAuth>()));
    gh.lazySingleton<_i8.IAuthFacade>(
        () => _i9.AuthRepo(gh<_i7.AuthService>()));
    gh.lazySingleton<_i10.UserService>(
        () => _i10.UserService(gh<_i4.FirebaseFirestore>()));
    gh.lazySingleton<_i11.IWeatherRepo>(
        () => _i12.WeatherRepo(gh<_i6.WeatherService>()));
    gh.lazySingleton<_i13.IUserRepo>(() => _i14.UserRepo(
          gh<_i7.AuthService>(),
          gh<_i10.UserService>(),
        ));
    gh.factory<_i15.WeatherCubit>(
        () => _i15.WeatherCubit(gh<_i11.IWeatherRepo>()));
    gh.factory<_i16.RegisterCubit>(
        () => _i16.RegisterCubit(gh<_i13.IUserRepo>()));
    gh.factory<_i17.SelectCityCubit>(
        () => _i17.SelectCityCubit(gh<_i13.IUserRepo>()));
    gh.factory<_i18.UpdateUserCubit>(
        () => _i18.UpdateUserCubit(gh<_i13.IUserRepo>()));
    gh.factory<_i19.AuthCubit>(() => _i19.AuthCubit(
          gh<_i8.IAuthFacade>(),
          gh<_i13.IUserRepo>(),
        ));
    gh.factory<_i20.LoginCubit>(() => _i20.LoginCubit(
          gh<_i8.IAuthFacade>(),
          gh<_i13.IUserRepo>(),
        ));
    return this;
  }
}

class _$InjectableModules extends _i21.InjectableModules {}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:firebase_database/firebase_database.dart' as _i6;
import 'package:flutter_application_1/application/auth/auth_cubit.dart' as _i32;
import 'package:flutter_application_1/application/cities/cities_cubit.dart'
    as _i19;
import 'package:flutter_application_1/application/create_city/create_city_cubit.dart'
    as _i18;
import 'package:flutter_application_1/application/login/login_cubit.dart'
    as _i30;
import 'package:flutter_application_1/application/register/register_cubit.dart'
    as _i27;
import 'package:flutter_application_1/application/select_city/select_city_cubit.dart'
    as _i28;
import 'package:flutter_application_1/application/update_rainfall/update_rainfall_cubit.dart'
    as _i21;
import 'package:flutter_application_1/application/update_user/update_user_cubit.dart'
    as _i29;
import 'package:flutter_application_1/application/watch_city/watch_city_cubit.dart'
    as _i20;
import 'package:flutter_application_1/application/water_level/water_level_cubit.dart'
    as _i31;
import 'package:flutter_application_1/application/weather/weather_cubit.dart'
    as _i24;
import 'package:flutter_application_1/domain/auth/i_auth_facade.dart' as _i25;
import 'package:flutter_application_1/domain/city/i_city_repo.dart' as _i14;
import 'package:flutter_application_1/domain/user/i_user_repo.dart' as _i16;
import 'package:flutter_application_1/domain/water_level/i_water_level_repo.dart'
    as _i22;
import 'package:flutter_application_1/domain/weather/i_weather_repo.dart'
    as _i12;
import 'package:flutter_application_1/infrastructure/repo/auth_repo.dart'
    as _i26;
import 'package:flutter_application_1/infrastructure/repo/city_repo.dart'
    as _i15;
import 'package:flutter_application_1/infrastructure/repo/user_repo.dart'
    as _i17;
import 'package:flutter_application_1/infrastructure/repo/water_level_repo.dart'
    as _i23;
import 'package:flutter_application_1/infrastructure/repo/weather_repo.dart'
    as _i13;
import 'package:flutter_application_1/infrastructure/services/auth_service.dart'
    as _i9;
import 'package:flutter_application_1/infrastructure/services/city/city_service.dart'
    as _i10;
import 'package:flutter_application_1/infrastructure/services/core/injectable_modules.dart'
    as _i33;
import 'package:flutter_application_1/infrastructure/services/flood/water_level_service.dart'
    as _i7;
import 'package:flutter_application_1/infrastructure/services/user_service.dart'
    as _i11;
import 'package:flutter_application_1/infrastructure/services/weather/weather_api_client.dart'
    as _i5;
import 'package:flutter_application_1/infrastructure/services/weather/weather_service.dart'
    as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

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
    gh.lazySingleton<_i6.FirebaseDatabase>(() => injectableModules.database);
    gh.lazySingleton<_i7.WaterLevelService>(
        () => _i7.WaterLevelService(gh<_i6.FirebaseDatabase>()));
    gh.lazySingleton<_i8.WeatherService>(
        () => _i8.WeatherService(gh<_i5.WeatherApiClient>()));
    gh.lazySingleton<_i9.AuthService>(
        () => _i9.AuthService(gh<_i3.FirebaseAuth>()));
    gh.lazySingleton<_i10.CityService>(
        () => _i10.CityService(gh<_i4.FirebaseFirestore>()));
    gh.lazySingleton<_i11.UserService>(
        () => _i11.UserService(gh<_i4.FirebaseFirestore>()));
    gh.lazySingleton<_i12.IWeatherRepo>(
        () => _i13.WeatherRepo(gh<_i8.WeatherService>()));
    gh.lazySingleton<_i14.ICityRepo>(
        () => _i15.CityRepo(gh<_i10.CityService>()));
    gh.lazySingleton<_i16.IUserRepo>(() => _i17.UserRepo(
          gh<_i9.AuthService>(),
          gh<_i11.UserService>(),
        ));
    gh.factory<_i18.CreateCityCubit>(
        () => _i18.CreateCityCubit(gh<_i14.ICityRepo>()));
    gh.factory<_i19.CitiesCubit>(() => _i19.CitiesCubit(gh<_i14.ICityRepo>()));
    gh.factory<_i20.WatchCityCubit>(
        () => _i20.WatchCityCubit(gh<_i14.ICityRepo>()));
    gh.factory<_i21.UpdateRainfallCubit>(
        () => _i21.UpdateRainfallCubit(gh<_i14.ICityRepo>()));
    gh.lazySingleton<_i22.IWaterLevelRepo>(
        () => _i23.WaterLevelRepo(gh<_i7.WaterLevelService>()));
    gh.factory<_i24.WeatherCubit>(
        () => _i24.WeatherCubit(gh<_i12.IWeatherRepo>()));
    gh.lazySingleton<_i25.IAuthFacade>(
        () => _i26.AuthRepo(gh<_i9.AuthService>()));
    gh.factory<_i27.RegisterCubit>(
        () => _i27.RegisterCubit(gh<_i16.IUserRepo>()));
    gh.factory<_i28.SelectCityCubit>(
        () => _i28.SelectCityCubit(gh<_i16.IUserRepo>()));
    gh.factory<_i29.UpdateUserCubit>(
        () => _i29.UpdateUserCubit(gh<_i16.IUserRepo>()));
    gh.factory<_i30.LoginCubit>(() => _i30.LoginCubit(
          gh<_i25.IAuthFacade>(),
          gh<_i16.IUserRepo>(),
        ));
    gh.factory<_i31.WaterLevelCubit>(
        () => _i31.WaterLevelCubit(gh<_i22.IWaterLevelRepo>()));
    gh.factory<_i32.AuthCubit>(() => _i32.AuthCubit(
          gh<_i25.IAuthFacade>(),
          gh<_i16.IUserRepo>(),
          gh<_i14.ICityRepo>(),
        ));
    return this;
  }
}

class _$InjectableModules extends _i33.InjectableModules {}

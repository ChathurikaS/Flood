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
import 'package:flutter_application_1/application/auth/auth_cubit.dart' as _i36;
import 'package:flutter_application_1/application/cities/cities_cubit.dart'
    as _i21;
import 'package:flutter_application_1/application/create_city/create_city_cubit.dart'
    as _i22;
import 'package:flutter_application_1/application/flood_level/flood_level_cubit.dart'
    as _i20;
import 'package:flutter_application_1/application/login/login_cubit.dart'
    as _i34;
import 'package:flutter_application_1/application/register/register_cubit.dart'
    as _i31;
import 'package:flutter_application_1/application/register_sensor/register_sensor_cubit.dart'
    as _i23;
import 'package:flutter_application_1/application/select_city/select_city_cubit.dart'
    as _i32;
import 'package:flutter_application_1/application/update_rainfall/update_rainfall_cubit.dart'
    as _i24;
import 'package:flutter_application_1/application/update_user/update_user_cubit.dart'
    as _i33;
import 'package:flutter_application_1/application/watch_city/watch_city_cubit.dart'
    as _i25;
import 'package:flutter_application_1/application/water_level/water_level_cubit.dart'
    as _i35;
import 'package:flutter_application_1/application/weather/weather_cubit.dart'
    as _i28;
import 'package:flutter_application_1/domain/auth/i_auth_facade.dart' as _i29;
import 'package:flutter_application_1/domain/city/i_city_repo.dart' as _i16;
import 'package:flutter_application_1/domain/flood/i_flood_repo.dart' as _i11;
import 'package:flutter_application_1/domain/user/i_user_repo.dart' as _i18;
import 'package:flutter_application_1/domain/water_level/i_water_level_repo.dart'
    as _i26;
import 'package:flutter_application_1/domain/weather/i_weather_repo.dart'
    as _i14;
import 'package:flutter_application_1/infrastructure/repo/auth_repo.dart'
    as _i30;
import 'package:flutter_application_1/infrastructure/repo/city_repo.dart'
    as _i17;
import 'package:flutter_application_1/infrastructure/repo/flood_repo.dart'
    as _i12;
import 'package:flutter_application_1/infrastructure/repo/user_repo.dart'
    as _i19;
import 'package:flutter_application_1/infrastructure/repo/water_level_repo.dart'
    as _i27;
import 'package:flutter_application_1/infrastructure/repo/weather_repo.dart'
    as _i15;
import 'package:flutter_application_1/infrastructure/services/auth_service.dart'
    as _i9;
import 'package:flutter_application_1/infrastructure/services/city/city_service.dart'
    as _i10;
import 'package:flutter_application_1/infrastructure/services/core/injectable_modules.dart'
    as _i37;
import 'package:flutter_application_1/infrastructure/services/flood/flood_service.dart'
    as _i7;
import 'package:flutter_application_1/infrastructure/services/user_service.dart'
    as _i13;
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
    gh.lazySingleton<_i7.FloodService>(
        () => _i7.FloodService(gh<_i6.FirebaseDatabase>()));
    gh.lazySingleton<_i8.WeatherService>(
        () => _i8.WeatherService(gh<_i5.WeatherApiClient>()));
    gh.lazySingleton<_i9.AuthService>(
        () => _i9.AuthService(gh<_i3.FirebaseAuth>()));
    gh.lazySingleton<_i10.CityService>(
        () => _i10.CityService(gh<_i4.FirebaseFirestore>()));
    gh.lazySingleton<_i11.IFloodRepo>(
        () => _i12.FloodRepo(gh<_i7.FloodService>()));
    gh.lazySingleton<_i13.UserService>(
        () => _i13.UserService(gh<_i4.FirebaseFirestore>()));
    gh.lazySingleton<_i14.IWeatherRepo>(
        () => _i15.WeatherRepo(gh<_i8.WeatherService>()));
    gh.lazySingleton<_i16.ICityRepo>(
        () => _i17.CityRepo(gh<_i10.CityService>()));
    gh.lazySingleton<_i18.IUserRepo>(() => _i19.UserRepo(
          gh<_i9.AuthService>(),
          gh<_i13.UserService>(),
        ));
    gh.factory<_i20.FloodLevelCubit>(
        () => _i20.FloodLevelCubit(gh<_i11.IFloodRepo>()));
    gh.factory<_i21.CitiesCubit>(() => _i21.CitiesCubit(gh<_i16.ICityRepo>()));
    gh.factory<_i22.CreateCityCubit>(
        () => _i22.CreateCityCubit(gh<_i16.ICityRepo>()));
    gh.factory<_i23.RegisterSensorCubit>(
        () => _i23.RegisterSensorCubit(gh<_i16.ICityRepo>()));
    gh.factory<_i24.UpdateRainfallCubit>(
        () => _i24.UpdateRainfallCubit(gh<_i16.ICityRepo>()));
    gh.factory<_i25.WatchCityCubit>(
        () => _i25.WatchCityCubit(gh<_i16.ICityRepo>()));
    gh.lazySingleton<_i26.IWaterLevelRepo>(
        () => _i27.WaterLevelRepo(gh<_i7.FloodService>()));
    gh.factory<_i28.WeatherCubit>(
        () => _i28.WeatherCubit(gh<_i14.IWeatherRepo>()));
    gh.lazySingleton<_i29.IAuthFacade>(
        () => _i30.AuthRepo(gh<_i9.AuthService>()));
    gh.factory<_i31.RegisterCubit>(
        () => _i31.RegisterCubit(gh<_i18.IUserRepo>()));
    gh.factory<_i32.SelectCityCubit>(
        () => _i32.SelectCityCubit(gh<_i18.IUserRepo>()));
    gh.factory<_i33.UpdateUserCubit>(
        () => _i33.UpdateUserCubit(gh<_i18.IUserRepo>()));
    gh.factory<_i34.LoginCubit>(() => _i34.LoginCubit(
          gh<_i29.IAuthFacade>(),
          gh<_i18.IUserRepo>(),
        ));
    gh.factory<_i35.WaterLevelCubit>(
        () => _i35.WaterLevelCubit(gh<_i26.IWaterLevelRepo>()));
    gh.factory<_i36.AuthCubit>(() => _i36.AuthCubit(
          gh<_i29.IAuthFacade>(),
          gh<_i18.IUserRepo>(),
          gh<_i16.ICityRepo>(),
        ));
    return this;
  }
}

class _$InjectableModules extends _i37.InjectableModules {}

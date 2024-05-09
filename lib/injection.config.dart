// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:firebase_database/firebase_database.dart' as _i7;
import 'package:flutter_application_1/application/auth/auth_cubit.dart' as _i37;
import 'package:flutter_application_1/application/cities/cities_cubit.dart'
    as _i22;
import 'package:flutter_application_1/application/create_city/create_city_cubit.dart'
    as _i23;
import 'package:flutter_application_1/application/cubit/date_cubit.dart' as _i3;
import 'package:flutter_application_1/application/flood_level/flood_level_cubit.dart'
    as _i21;
import 'package:flutter_application_1/application/login/login_cubit.dart'
    as _i35;
import 'package:flutter_application_1/application/register/register_cubit.dart'
    as _i32;
import 'package:flutter_application_1/application/register_sensor/register_sensor_cubit.dart'
    as _i24;
import 'package:flutter_application_1/application/select_city/select_city_cubit.dart'
    as _i33;
import 'package:flutter_application_1/application/update_rainfall/update_rainfall_cubit.dart'
    as _i25;
import 'package:flutter_application_1/application/update_user/update_user_cubit.dart'
    as _i34;
import 'package:flutter_application_1/application/watch_city/watch_city_cubit.dart'
    as _i26;
import 'package:flutter_application_1/application/water_level/water_level_cubit.dart'
    as _i36;
import 'package:flutter_application_1/application/weather/weather_cubit.dart'
    as _i29;
import 'package:flutter_application_1/domain/auth/i_auth_facade.dart' as _i30;
import 'package:flutter_application_1/domain/city/i_city_repo.dart' as _i17;
import 'package:flutter_application_1/domain/flood/i_flood_repo.dart' as _i12;
import 'package:flutter_application_1/domain/user/i_user_repo.dart' as _i19;
import 'package:flutter_application_1/domain/water_level/i_water_level_repo.dart'
    as _i27;
import 'package:flutter_application_1/domain/weather/i_weather_repo.dart'
    as _i15;
import 'package:flutter_application_1/infrastructure/repo/auth_repo.dart'
    as _i31;
import 'package:flutter_application_1/infrastructure/repo/city_repo.dart'
    as _i18;
import 'package:flutter_application_1/infrastructure/repo/flood_repo.dart'
    as _i13;
import 'package:flutter_application_1/infrastructure/repo/user_repo.dart'
    as _i20;
import 'package:flutter_application_1/infrastructure/repo/water_level_repo.dart'
    as _i28;
import 'package:flutter_application_1/infrastructure/repo/weather_repo.dart'
    as _i16;
import 'package:flutter_application_1/infrastructure/services/auth_service.dart'
    as _i10;
import 'package:flutter_application_1/infrastructure/services/city/city_service.dart'
    as _i11;
import 'package:flutter_application_1/infrastructure/services/core/injectable_modules.dart'
    as _i38;
import 'package:flutter_application_1/infrastructure/services/flood/flood_service.dart'
    as _i8;
import 'package:flutter_application_1/infrastructure/services/user_service.dart'
    as _i14;
import 'package:flutter_application_1/infrastructure/services/weather/weather_api_client.dart'
    as _i6;
import 'package:flutter_application_1/infrastructure/services/weather/weather_service.dart'
    as _i9;
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
    gh.factory<_i3.DateCubit>(() => _i3.DateCubit());
    gh.lazySingleton<_i4.FirebaseAuth>(() => injectableModules.auth);
    gh.lazySingleton<_i5.FirebaseFirestore>(() => injectableModules.firestore);
    gh.lazySingleton<_i6.WeatherApiClient>(
        () => injectableModules.weatherApiClient);
    gh.lazySingleton<_i7.FirebaseDatabase>(() => injectableModules.database);
    gh.lazySingleton<_i8.FloodService>(
        () => _i8.FloodService(gh<_i7.FirebaseDatabase>()));
    gh.lazySingleton<_i9.WeatherService>(
        () => _i9.WeatherService(gh<_i6.WeatherApiClient>()));
    gh.lazySingleton<_i10.AuthService>(
        () => _i10.AuthService(gh<_i4.FirebaseAuth>()));
    gh.lazySingleton<_i11.CityService>(
        () => _i11.CityService(gh<_i5.FirebaseFirestore>()));
    gh.lazySingleton<_i12.IFloodRepo>(
        () => _i13.FloodRepo(gh<_i8.FloodService>()));
    gh.lazySingleton<_i14.UserService>(
        () => _i14.UserService(gh<_i5.FirebaseFirestore>()));
    gh.lazySingleton<_i15.IWeatherRepo>(
        () => _i16.WeatherRepo(gh<_i9.WeatherService>()));
    gh.lazySingleton<_i17.ICityRepo>(
        () => _i18.CityRepo(gh<_i11.CityService>()));
    gh.lazySingleton<_i19.IUserRepo>(() => _i20.UserRepo(
          gh<_i10.AuthService>(),
          gh<_i14.UserService>(),
        ));
    gh.factory<_i21.FloodLevelCubit>(
        () => _i21.FloodLevelCubit(gh<_i12.IFloodRepo>()));
    gh.factory<_i22.CitiesCubit>(() => _i22.CitiesCubit(gh<_i17.ICityRepo>()));
    gh.factory<_i23.CreateCityCubit>(
        () => _i23.CreateCityCubit(gh<_i17.ICityRepo>()));
    gh.factory<_i24.RegisterSensorCubit>(
        () => _i24.RegisterSensorCubit(gh<_i17.ICityRepo>()));
    gh.factory<_i25.UpdateRainfallCubit>(
        () => _i25.UpdateRainfallCubit(gh<_i17.ICityRepo>()));
    gh.factory<_i26.WatchCityCubit>(
        () => _i26.WatchCityCubit(gh<_i17.ICityRepo>()));
    gh.lazySingleton<_i27.IWaterLevelRepo>(
        () => _i28.WaterLevelRepo(gh<_i8.FloodService>()));
    gh.factory<_i29.WeatherCubit>(
        () => _i29.WeatherCubit(gh<_i15.IWeatherRepo>()));
    gh.lazySingleton<_i30.IAuthFacade>(
        () => _i31.AuthRepo(gh<_i10.AuthService>()));
    gh.factory<_i32.RegisterCubit>(
        () => _i32.RegisterCubit(gh<_i19.IUserRepo>()));
    gh.factory<_i33.SelectCityCubit>(
        () => _i33.SelectCityCubit(gh<_i19.IUserRepo>()));
    gh.factory<_i34.UpdateUserCubit>(
        () => _i34.UpdateUserCubit(gh<_i19.IUserRepo>()));
    gh.factory<_i35.LoginCubit>(() => _i35.LoginCubit(
          gh<_i30.IAuthFacade>(),
          gh<_i19.IUserRepo>(),
        ));
    gh.factory<_i36.WaterLevelCubit>(
        () => _i36.WaterLevelCubit(gh<_i27.IWaterLevelRepo>()));
    gh.factory<_i37.AuthCubit>(() => _i37.AuthCubit(
          gh<_i30.IAuthFacade>(),
          gh<_i19.IUserRepo>(),
          gh<_i17.ICityRepo>(),
        ));
    return this;
  }
}

class _$InjectableModules extends _i38.InjectableModules {}

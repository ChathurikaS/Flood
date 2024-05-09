import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/domain/city/city.dart';
import 'package:flutter_application_1/domain/city/i_city_repo.dart';
import 'package:flutter_application_1/domain/failure/failure.dart';
import 'package:flutter_application_1/infrastructure/services/city/city_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ICityRepo)
class CityRepo implements ICityRepo {
  final CityService _cityService;

  CityRepo(this._cityService);

  @override
  Future<Either<Failure, None>> create(String name) =>
      _cityService.create(name);

  @override
  Future<Either<Failure, List<City>>> getAll() => _cityService.getAll();

  @override
  Future<Either<Failure, None>> update(City city) => _cityService.update(city);

  @override
  Stream<City> watchCity(String id) => _cityService.watchCity(id);

  @override
  Future<Either<Failure, City>> get(String id) => _cityService.get(id);
}

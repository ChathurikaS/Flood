import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/domain/city/city.dart';
import 'package:flutter_application_1/domain/failure/failure.dart';

abstract class ICityRepo {
  Future<Either<Failure, None>> create(String name);
  Future<Either<Failure, List<City>>> getAll();
  Future<Either<Failure, City>> get(String id);
  Future<Either<Failure, None>> update(City city);
  Stream<City> watchCity(String id);
}

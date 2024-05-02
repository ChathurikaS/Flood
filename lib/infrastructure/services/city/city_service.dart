import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/domain/city/city.dart';
import 'package:flutter_application_1/domain/failure/failure.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CityService {
  final FirebaseFirestore _firestore;

  CityService(this._firestore);

  CollectionReference get _citiesRef => _firestore.collection("cities");

  Future<Either<Failure, None>> create(String name) async {
    try {
      final doc = _citiesRef.doc();
      await doc.set(City(id: doc.id, name: name, rainfall: 0).toJson());
      return const Right(None());
    } catch (e) {
      return const Left(Failure(message: "Failed to create city"));
    }
  }

  Future<Either<Failure, List<City>>> getAll() async {
    try {
      final snapshot = await _citiesRef.get();
      final cities = snapshot.docs
          .map((e) => City.fromJson(e.data() as Map<String, dynamic>))
          .toList();
      return Right(cities);
    } catch (e) {
      log(e.toString());
      return const Left(Failure(message: "Failed to load cities"));
    }
  }

  Future<Either<Failure, None>> update(City city) async {
    try {
      await _citiesRef.doc(city.id).set(city.toJson());
      return const Right(None());
    } catch (e) {
      return const Left(Failure(message: "Failed to update city"));
    }
  }

  Stream<City> watchCity(String id) async* {
    yield* _citiesRef
        .doc(id)
        .snapshots()
        .map((event) => City.fromJson(event.data() as Map<String, dynamic>));
  }

  Future<Either<Failure, City>> get(String id) async {
    try {
      final doc = await _citiesRef.doc(id).get();
      final city = City.fromJson(doc.data() as Map<String, dynamic>);
      return Right(city);
    } catch (e) {
      return const Left(Failure(message: "Failed to get city"));
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_application_1/infrastructure/services/weather/weather_api_client.dart';

@module
abstract class InjectableModules {
  @lazySingleton
  FirebaseAuth get auth => FirebaseAuth.instance;

  @lazySingleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @lazySingleton
  WeatherApiClient get weatherApiClient => WeatherApiClient.create();
}

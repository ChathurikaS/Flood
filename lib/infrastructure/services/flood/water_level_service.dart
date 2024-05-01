import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class WaterLevelService {
  final FirebaseDatabase _database;

  WaterLevelService(this._database);

  Stream<int> watchWaterLevel(String cityId) async* {
    yield* _database
        .ref("waterLevel/$cityId")
        .onValue
        .map((event) => event.snapshot.value as int);
  }

  // int _calculateWaterLevel({})
}

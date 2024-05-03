import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FloodService {
  final FirebaseDatabase _database;

  FloodService(this._database);

  Stream<int> watchFlood(String cityId) async* {
    yield* _database
        .ref("waterLevel/$cityId")
        .onValue
        .map((event) => _processed(event.snapshot.value as int));
  }

  int _processed(int value) {
    const sensorMax = 210;
    const filled = 140;
    int reversed = 0;
    if (value > sensorMax) {
      reversed = 0;
    } else {
      reversed = sensorMax - value;
    }
    return reversed * filled ~/ 100;
  }
}

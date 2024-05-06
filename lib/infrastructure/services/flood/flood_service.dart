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
    int limitedValue = _limitedValue(value);
    return 140 - limitedValue;
  }

  int _limitedValue(int value) {
    if (value > 140) {
      return 140;
    }
    return value;
  }
}

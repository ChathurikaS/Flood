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
        .map((event) => event.snapshot.value as int);
  }
}

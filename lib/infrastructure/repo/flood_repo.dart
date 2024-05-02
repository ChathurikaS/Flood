import 'package:flutter_application_1/domain/flood/i_flood_repo.dart';
import 'package:flutter_application_1/infrastructure/services/flood/flood_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IFloodRepo)
class FloodRepo implements IFloodRepo {
  final FloodService _floodService;

  FloodRepo(this._floodService);
  @override
  Stream<int> watchFlood(String cityId) => _floodService.watchFlood(cityId);
}

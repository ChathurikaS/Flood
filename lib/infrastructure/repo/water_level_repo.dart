import 'package:flutter_application_1/domain/water_level/i_water_level_repo.dart';
import 'package:flutter_application_1/infrastructure/services/flood/flood_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IWaterLevelRepo)
class WaterLevelRepo implements IWaterLevelRepo {
  final FloodService _waterLevelService;

  WaterLevelRepo(this._waterLevelService);
  @override
  Stream<int> watchWaterLevel(String cityId) =>
      _waterLevelService.watchFlood(cityId);
}

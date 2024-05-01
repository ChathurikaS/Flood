import 'package:flutter_application_1/domain/water_level/i_water_level_repo.dart';
import 'package:flutter_application_1/infrastructure/services/flood/water_level_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IWaterLevelRepo)
class WaterLevelRepo implements IWaterLevelRepo {
  final WaterLevelService _waterLevelService;

  WaterLevelRepo(this._waterLevelService);
  @override
  Stream<int> watchWaterLevel(String cityId) =>
      _waterLevelService.watchWaterLevel(cityId);
}
